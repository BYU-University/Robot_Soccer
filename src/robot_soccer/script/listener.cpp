#include "ros/ros.h"
#include "std_msgs/String.h"
#include "std_msgs/Int32.h"
#include "walle/Num.h"
#include "time.h"
#include "stdio.h"

#include "motorControl.cpp"
#include "utility.c"
#include "strategy.c"
#include "skill.c"
#include "play.c"
#include "calibrate.c"
#include "control.c"

//#include "strategy.h"
//#include "motorControl.h"


bool timeSet = false;

/**
 * This tutorial demonstrates simple receipt of messages over the ROS system.
 */
void chatterCallback(const walle::Num::ConstPtr& msg)
{
	control_receiveCoords((coord3){msg->home1_x, msg->home1_y, msg->home1_theta}, (coord3){msg->away1_x, msg->away1_y, msg->away1_w}, (coord2){msg->ball_x, msg->ball_y}, msg->tsys);
	if(!timeSet)
	{
//		utility_setTime_s(msg->tsys);
		timeSet = true;
	}
}


void commandCallback(const std_msgs::Int32::ConstPtr& msg)
{
	control_pressKey(msg->data);
}

int main(int argc, char **argv)
{
	motorControl_init();
	ros::init(argc, argv, "computer_vision");
	ros::NodeHandle n;
	ros::Subscriber sub = n.subscribe("locTopic", 10, chatterCallback);
	//ros::Subscriber sub2 = n.subscribe("command", 10, commandCallback);
	//ros::Publisher pub = n.advertise<walle::Num>("feedback", 5);
	ros::Rate loop_rate(TICKS_PER_SECOND);
	int counter = 0;
	while(ros::ok())
	{
		counter++;
		if(counter % 2 == 0)
		{
			walle::Num msg;
			msg.home1_x = robot1currentPosition.x;
			msg.home1_y = robot1currentPosition.y;
			msg.home1_theta = robot1currentPosition.w;
			msg.away1_x = robot1cameraPositionAverage.x;
			msg.away1_y = robot1cameraPositionAverage.y;
			msg.away1_theta = robot1cameraPositionAverage.w;
			pub.publish(msg);
		}
		DEBUG_PRINT = (counter % 25 == 0);

		ros::spinOnce();
		strategy_tick();
		play_tick();
		skill_tick();
		motorControl_tick();
		calibrate_tick();
		loop_rate.sleep();
	}
	printf("Exiting\n");

	motorControl_killMotors();
	close(serial_fd);
	return 0;
}
