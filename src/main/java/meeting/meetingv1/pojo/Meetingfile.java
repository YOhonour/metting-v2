package meeting.meetingv1.pojo;

public class Meetingfile {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column meetingfile.fileid
     *
     * @mbg.generated
     */
    private Integer fileid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column meetingfile.meetingid
     *
     * @mbg.generated
     */
    private Integer meetingid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column meetingfile.path
     *
     * @mbg.generated
     */
    private String path;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column meetingfile.name
     *
     * @mbg.generated
     */
    private String name;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table meetingfile
     *
     * @mbg.generated
     */
    public Meetingfile(Integer fileid, Integer meetingid, String path, String name) {
        this.fileid = fileid;
        this.meetingid = meetingid;
        this.path = path;
        this.name = name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table meetingfile
     *
     * @mbg.generated
     */
    public Meetingfile() {
        super();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column meetingfile.fileid
     *
     * @return the value of meetingfile.fileid
     *
     * @mbg.generated
     */
    public Integer getFileid() {
        return fileid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column meetingfile.fileid
     *
     * @param fileid the value for meetingfile.fileid
     *
     * @mbg.generated
     */
    public void setFileid(Integer fileid) {
        this.fileid = fileid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column meetingfile.meetingid
     *
     * @return the value of meetingfile.meetingid
     *
     * @mbg.generated
     */
    public Integer getMeetingid() {
        return meetingid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column meetingfile.meetingid
     *
     * @param meetingid the value for meetingfile.meetingid
     *
     * @mbg.generated
     */
    public void setMeetingid(Integer meetingid) {
        this.meetingid = meetingid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column meetingfile.path
     *
     * @return the value of meetingfile.path
     *
     * @mbg.generated
     */
    public String getPath() {
        return path;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column meetingfile.path
     *
     * @param path the value for meetingfile.path
     *
     * @mbg.generated
     */
    public void setPath(String path) {
        this.path = path == null ? null : path.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column meetingfile.name
     *
     * @return the value of meetingfile.name
     *
     * @mbg.generated
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column meetingfile.name
     *
     * @param name the value for meetingfile.name
     *
     * @mbg.generated
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }
}