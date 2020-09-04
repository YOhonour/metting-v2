package meeting.meetingv1.pojo;

public class Guest extends GuestKey {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column guest.avatar_url
     *
     * @mbg.generated
     */
    private String avatarUrl;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column guest.introduction
     *
     * @mbg.generated
     */
    private String introduction;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column guest.name
     *
     * @mbg.generated
     */
    private String name;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table guest
     *
     * @mbg.generated
     */
    public Guest(Integer guestid, Integer meetingid, String avatarUrl, String introduction, String name) {
        super(guestid, meetingid);
        this.avatarUrl = avatarUrl;
        this.introduction = introduction;
        this.name = name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table guest
     *
     * @mbg.generated
     */
    public Guest() {
        super();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column guest.avatar_url
     *
     * @return the value of guest.avatar_url
     *
     * @mbg.generated
     */
    public String getAvatarUrl() {
        return avatarUrl;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column guest.avatar_url
     *
     * @param avatarUrl the value for guest.avatar_url
     *
     * @mbg.generated
     */
    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl == null ? null : avatarUrl.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column guest.introduction
     *
     * @return the value of guest.introduction
     *
     * @mbg.generated
     */
    public String getIntroduction() {
        return introduction;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column guest.introduction
     *
     * @param introduction the value for guest.introduction
     *
     * @mbg.generated
     */
    public void setIntroduction(String introduction) {
        this.introduction = introduction == null ? null : introduction.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column guest.name
     *
     * @return the value of guest.name
     *
     * @mbg.generated
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column guest.name
     *
     * @param name the value for guest.name
     *
     * @mbg.generated
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }
}