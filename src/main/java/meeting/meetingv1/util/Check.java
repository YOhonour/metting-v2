package meeting.meetingv1.util;

import meeting.meetingv1.service.UserMeetingService;
import meeting.meetingv1.pojo.UserMeeting;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

public class Check {
    public static boolean checkUp(HttpServletRequest httpServletRequest, UserMeetingService userMeetingService, Integer meetingId){
        HttpSession session = httpServletRequest.getSession(false);
        Integer userId = (Integer)session.getAttribute("userId");
        List<UserMeeting> meetingsByBuilder = userMeetingService.getMeetingsByBuilder(userId);
        boolean flag = false;
        if (meetingsByBuilder.size() == 0){
            return false;
        }
        for (UserMeeting userMeeting :meetingsByBuilder){
            if (userMeeting.getMeetingid() == (meetingId)){
                return true;
            }
        }
        return false;
    }
    public static Integer getUserID(HttpServletRequest httpServletRequest){
        HttpSession session = httpServletRequest.getSession(false);
        return (Integer)session.getAttribute("userId");
    }
}
