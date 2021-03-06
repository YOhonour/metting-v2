package meeting.meetingv1.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import meeting.meetingv1.annotation.UserLoginToken;
import meeting.meetingv1.exception.ParameterException;
import meeting.meetingv1.pojo.Meeting;
import meeting.meetingv1.pojo.UserMeeting;
import meeting.meetingv1.service.MeetingService;
import meeting.meetingv1.service.UserMeetingService;
import meeting.meetingv1.util.Check;
import meeting.meetingv1.util.ResultBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@Api(tags = "用户与会议的交互接口")
public class UserMeetingControllor {

    @Autowired
    UserMeetingService userMeetingService;

    @UserLoginToken
    @PostMapping("/preference/{type}")
    @ApiOperation(value = "参加/收藏会议",notes = "参数： <br>1、登陆token<br>2、路径变量操作类型（2为参加 3为收藏 ）<br>3、会议id meetingId")
    public ResultBean preference(@PathVariable("type") Integer type, int meetingId, HttpServletRequest request) throws ParameterException {
        userMeetingService.addRelation(new UserMeeting(null, Check.getUserID(request),meetingId,new Byte(type.toString())));
        return ResultBean.success();
    }
    @UserLoginToken
    @PostMapping("/quit/{meetingId}")
    @ApiOperation(value = "退出会议 取消收藏会议",notes = "参数： <br>1、登陆token<br>2、操作类型 type （2为参加 3为收藏 ）<br>3、路径变量会议id meetingId")
    public ResultBean preference(@PathVariable("meetingId") Integer meetingId, Integer type, HttpServletRequest request) throws ParameterException {

        userMeetingService.delete(new UserMeeting(null, Check.getUserID(request),meetingId,new Byte(type.toString())));
        return ResultBean.success();
    }
    /***
     * type 1为创建 2为参加 3为收藏
     * 根据用户查询对应的
     * @param type
     * @param request
     * @return
     */
    @GetMapping("/preference/{type}")
    @UserLoginToken
    @ApiOperation(value = "获取与自己相关的会议信息",notes = "参数： <br>1、路径变量中类型：（1为创建 2为参加 3为收藏）<br>2、登陆toke" +
            "<br>一个成功的请求：" +
            "{\n" +
            "&nbsp;&nbsp;&nbsp;&nbsp;\"code\": 0,\n" +
            "&nbsp;&nbsp;&nbsp;&nbsp;\"message\": \"success\",\n" +
            "&nbsp;&nbsp;&nbsp;&nbsp;\"data\": {\n" +
            "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\"data\": [\n" +
            "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{\n" +
            "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\"id\": 10,\n" +
            "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\"userid\": 17,\n" +
            "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\"meetingid\": 1,\n" +
            "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\"type\": 2\n" +
            "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n" +
            "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;]\n" +
            "&nbsp;&nbsp;&nbsp;&nbsp;}\n" +
            "} " +
            "<br>其中data字段是一个数组")
    public ResultBean getPreferenceByUser(@PathVariable("type") String type, HttpServletRequest request){
        Map<String, List> map = new HashMap<>();
        List<UserMeeting> byMeet = userMeetingService.findPreferenceByUser(Check.getUserID(request), new Byte(type));
        map.put("data",byMeet);
        return ResultBean.success(map);
    }
    @GetMapping("/meetPreference/{type}")
    @ApiOperation(value = "获取自己会议 被参加、收藏、申请志愿者的详细信息 ",notes = "参数： <br>1、会议id meetingId<br>2、路径变量操作类型（2为参加 3为收藏）" +
            "<br>data字段中count为次数")
    public ResultBean getPreference(@PathVariable("type") String type, int meetingId){
        Map<String, List> map = new HashMap<>();
        List<UserMeeting> byMeet = userMeetingService.findPreferenceByMeet(meetingId, new Byte(type));
        map.put("data",byMeet);
        return ResultBean.success(map);
    }
    @GetMapping("/statistics/{type}")
    @ApiOperation(value = "获取会议被参加、收藏的次数",notes = "参数： <br>1、会议id meetingId<br>2、路径变量操作类型（2为参加 3为收藏）" +
            "<br>data字段中count为次数")
    public ResultBean getCount(@PathVariable("type") String type, int meetingId){
        int count = userMeetingService.getCount(new Byte(type), meetingId);
        Map<String,Integer> map = new HashMap<>();
        map.put("count",count);
        return ResultBean.success(map);
    }
    @Autowired
    MeetingService meetingService;
    //根据类型获取与自己有关的会议信息
    @GetMapping("my/meet/{type}")
    @ApiOperation(value = "获取与自己有关的会议信息",notes = "参数：" +
            "相关类型：1 创建的会议；2 参加的会议；3 收藏的会议 ；4  志愿者申请中 ；5 志愿者； 6 申请志愿者失败" +
            "<br>附带token")
    public ResultBean getMeetingsAboutMe(@PathVariable Byte type,HttpServletRequest request){
        HttpSession session = request.getSession(false);
        Object userId = session.getAttribute("userId");
        if (userId == null){
            return ResultBean.error(-13,"请登录");
        }
        List<UserMeeting> preferenceByUser = userMeetingService.findPreferenceByUser((Integer) userId, type);
        Map<String,List<Meeting>> meetingMap = new HashMap<>();
        List<Meeting> list = new ArrayList<>();
        for (UserMeeting userMeeting : preferenceByUser){
            Meeting byId = meetingService.findById(userMeeting.getMeetingid());
            list.add(byId);
        }
        meetingMap.put("meetings",list);
        return ResultBean.success(meetingMap);
    }
}
