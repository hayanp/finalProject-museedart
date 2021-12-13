package kr.or.reading.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.reading.model.vo.Reading;
import kr.or.reading.model.vo.ReadingBlack;

@Repository
public class ReadingDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ReadingBlack selectOneBlackList(String readingId) {
		
		return sqlSession.selectOne("reading.selectOneBlackList", readingId);
	}

	public Reading selectOneNum(Reading re) {
		return sqlSession.selectOne("reading.selectOneNum", re);
	}

	public int insertReading(Reading re) {
		
		return sqlSession.insert("reading.insertReading", re);
	}

	public Reading selectOneId(Reading re) {
		return sqlSession.selectOne("reading.selectOneId", re);
	}

	public int reservationCancel(Reading re) {
		return sqlSession.delete("reading.reservationCancel", re);
	}

	public int countSeat(String readingDay) {
		return sqlSession.selectOne("reading.countSeat", readingDay);
	}

	public ArrayList<Integer> chkSeat(Reading re) {
		List<Integer> list = sqlSession.selectList("reading.chkSeat", re);
		return (ArrayList<Integer>)list;
	}

	public ArrayList<Reading> selectWeekReading() {
		List<Reading> list = sqlSession.selectList("reading.selectWeekReading");
		return (ArrayList<Reading>)list;
	}


	public int expulsion(Reading re) {
		return sqlSession.update("reading.expulsion", re);
	}

	public int insertBlackList(Reading re) {
		return sqlSession.insert("reading.insertBlackList", re);
	}

	public int earlyOut(Reading re) {
		return sqlSession.update("reading.earlyOut", re);
	}

	
}
