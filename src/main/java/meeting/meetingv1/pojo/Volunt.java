package meeting.meetingv1.pojo;

public class Volunt {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column volunt.meetid
     *
     * @mbg.generated
     */
    private Integer meetid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column volunt.introduction
     *
     * @mbg.generated
     */
    private String introduction;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column volunt.number
     *
     * @mbg.generated
     */
    private Integer number;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column volunt.isproof
     *
     * @mbg.generated
     */
    private Integer isproof;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column volunt.full
     *
     * @mbg.generated
     */
    private Integer full;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table volunt
     *
     * @mbg.generated
     */
    public Volunt(Integer meetid, String introduction, Integer number, Integer isproof, Integer full) {
        this.meetid = meetid;
        this.introduction = introduction;
        this.number = number;
        this.isproof = isproof;
        this.full = full;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table volunt
     *
     * @mbg.generated
     */
    public Volunt() {
        super();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column volunt.meetid
     *
     * @return the value of volunt.meetid
     *
     * @mbg.generated
     */
    public Integer getMeetid() {
        return meetid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column volunt.meetid
     *
     * @param meetid the value for volunt.meetid
     *
     * @mbg.generated
     */
    public void setMeetid(Integer meetid) {
        this.meetid = meetid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column volunt.introduction
     *
     * @return the value of volunt.introduction
     *
     * @mbg.generated
     */
    public String getIntroduction() {
        return introduction;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column volunt.introduction
     *
     * @param introduction the value for volunt.introduction
     *
     * @mbg.generated
     */
    public void setIntroduction(String introduction) {
        this.introduction = introduction == null ? null : introduction.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column volunt.number
     *
     * @return the value of volunt.number
     *
     * @mbg.generated
     */
    public Integer getNumber() {
        return number;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column volunt.number
     *
     * @param number the value for volunt.number
     *
     * @mbg.generated
     */
    public void setNumber(Integer number) {
        this.number = number;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column volunt.isproof
     *
     * @return the value of volunt.isproof
     *
     * @mbg.generated
     */
    public Integer getIsproof() {
        return isproof;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column volunt.isproof
     *
     * @param isproof the value for volunt.isproof
     *
     * @mbg.generated
     */
    public void setIsproof(Integer isproof) {
        this.isproof = isproof;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column volunt.full
     *
     * @return the value of volunt.full
     *
     * @mbg.generated
     */
    public Integer getFull() {
        return full;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column volunt.full
     *
     * @param full the value for volunt.full
     *
     * @mbg.generated
     */
    public void setFull(Integer full) {
        this.full = full;
    }
}