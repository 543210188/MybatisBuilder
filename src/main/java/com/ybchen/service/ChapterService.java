package com.ybchen.service;

import com.ybchen.entity.Chapter;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ChapterService{

    /**
    *  查询表chapter所有信息
    */
    List<Chapter> findAllChapter();

    /**
    *  根据主键id查询表chapter信息
    *  @param id
    */
    Chapter findChapterByid(@Param("id") Integer id);

    /**
    *  根据条件查询表chapter信息
    *  @param chapter
    */
    List<Chapter> findChapterByCondition(Chapter chapter);

    /**
    *  根据主键id查询表chapter信息
    *  @param id
    */
    Integer deleteChapterByid(@Param("id") Integer id);

    /**
    *  根据主键id更新表chapter信息
    *  @param chapter
    */
    Integer updateChapterByid(Chapter chapter);

    /**
    *  新增表chapter信息
    *  @param chapter
    */
    Integer addChapter(Chapter chapter);
}