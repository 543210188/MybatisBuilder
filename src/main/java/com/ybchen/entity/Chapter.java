package com.ybchen.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * chapter : 章
 */
public class Chapter  implements Serializable {

	private static final long serialVersionUID = 1L;

    /**
     * 主键 : id,  
     */
    private Integer id;

    /**
     * video_id,  视频主键
     */
    private Integer videoId;

    /**
     * title,  章节名称
     */
    private String title;

    /**
     * ordered,  章节顺序
     */
    private Integer ordered;

    /**
     * create_time,  创建时间
     */
    private Date createTime;

	public Chapter(Integer id,Integer videoId,String title,Integer ordered,Date createTime){
			this.id = id;
			this.videoId = videoId;
			this.title = title;
			this.ordered = ordered;
			this.createTime = createTime;
	}
	
	public Chapter(){
	}

    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public Integer getVideoId() {
        return videoId;
    }
    public void setVideoId(Integer videoId) {
        this.videoId = videoId;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public Integer getOrdered() {
        return ordered;
    }
    public void setOrdered(Integer ordered) {
        this.ordered = ordered;
    }
    public Date getCreateTime() {
        return createTime;
    }
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Chapter{" +
        "id=" + id +
        ", videoId=" + videoId +
        ", title=" + title +
        ", ordered=" + ordered +
        ", createTime=" + createTime +
        "}";
    }
}
