package com.ybchen.service.impl;

import com.ybchen.entity.Chapter;
import com.ybchen.mapper.ChapterMapper;
import com.ybchen.service.ChapterService;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Service
public class ChapterServiceImpl implements ChapterService {
	
	@Autowired
	private ChapterMapper chapterMapper;

	/**
	*  查询表chapter所有信息
	*/
	@Override
	public List<Chapter> findAllChapter() { return chapterMapper.findAllChapter();}

	/**
	*  根据主键id查询表chapter信息
	*  @param id
	*/
	@Override
	public Chapter findChapterByid(@Param("id") Integer id) { return chapterMapper.findChapterByid(id);}

	/**
	*  根据条件查询表chapter信息
	*  @param chapter
	*/
	@Override
	public List<Chapter> findChapterByCondition(Chapter chapter) { return chapterMapper.findChapterByCondition(chapter);}

	/**
	*  根据主键id查询表chapter信息
	*  @param id
	*/
	@Override
	public Integer deleteChapterByid(@Param("id") Integer id) { return chapterMapper.deleteChapterByid(id);}

	/**
	*  根据主键id更新表chapter信息
	*  @param chapter
	*/
	@Override
	public Integer updateChapterByid(Chapter chapter) { return chapterMapper.updateChapterByid(chapter);}

	/**
	*  新增表chapter信息
	*  @param chapter
	*/
	@Override
	public Integer addChapter(Chapter chapter) { return chapterMapper.addChapter(chapter);}

}
