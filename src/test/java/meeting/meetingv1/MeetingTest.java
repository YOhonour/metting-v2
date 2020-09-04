package meeting.meetingv1;

import meeting.meetingv1.pojo.Meeting;
import meeting.meetingv1.service.MeetingService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
public class MeetingTest {
    @Autowired
    MeetingService meetingService;

    @Test
    void name1() {
        List<Meeting> byStartLimit = meetingService.findMeetingsOrderByStartLimit(0, 5);
        System.out.println(byStartLimit);
    }
}
