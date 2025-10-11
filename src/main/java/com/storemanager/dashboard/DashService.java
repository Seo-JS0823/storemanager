package com.storemanager.dashboard;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class DashService {
	
	@Autowired
	private DashMapper dashMapper;
	
	@Autowired
	private DateSupport date;
	
	// 당월 입고가 총계
	public Integer nowInPrice() {
		// 당월 입고가 총계 구하기
		return dashMapper.nowInPrice(date.getNowFirstDate(), date.getNowEndDate());
	}
	
	// 당월 출고가 총계
	public Integer nowOutPrice() {
		// 당월 출고가 총계 구하기
		return dashMapper.nowOutPrice(date.getNowFirstDate(), date.getNowEndDate());
	}
	
	// 전월 매출액
	public Integer befSales() {
<<<<<<< HEAD
		Integer in = dashMapper.nowInPrice(date.getNowFirstDate(), date.getNowEndDate());
		Integer out = dashMapper.nowOutPrice(date.getNowFirstDate(), date.getNowEndDate());
		return out - in;
	}
	
	// 당월 총 입/출고 TOP 5 - JS 객체 저장
	public Map<String, Object> stickTotalNow() {
		List<DashDTO> totalIn = dashMapper.stickTotalNowIn(date.getNowFirstDate(), date.getNowEndDate());
		List<DashDTO> totalOut = dashMapper.stickTotalNowOut(date.getNowFirstDate(), date.getNowEndDate());
		
		List<Integer> totalInPrice = totalIn.stream().map(DashDTO::getOrders).collect(Collectors.toList());
		List<Integer> totalOutPrice = totalOut.stream().map(DashDTO::getOrders).collect(Collectors.toList());
		
		Integer totalInSum = totalInPrice.stream().mapToInt(Integer::intValue).sum();
		Integer totalOutSum = totalOutPrice.stream().mapToInt(Integer::intValue).sum();
		
		List<Double> totalInPer
		= totalInPrice.stream()
		            .map(num -> ((double) num / totalInSum) * 100.0)
		            .map(per -> Math.floor(per * 100.0) / 100.0)
		            .collect(Collectors.toList());
		
		List<Double> totalOutPer
		= totalOutPrice.stream()
		             .map(num -> ((double) num / totalOutSum) * 100.0)
		             .map(per -> Math.floor(per * 100.0) / 100.0)
		             .collect(Collectors.toList());
		
		Map<String, Object> response = Map.of(
			"total_in", totalIn, "total_in_qty", totalInPrice,
			"total_in_sum", totalInSum, "total_in_per", totalInPer,
			
			"total_out", totalOut, "total_out_qty", totalOutPrice,
			"total_out_sum", totalOutSum, "total_out_per", totalOutPer
		);
		
		return response;
	}
	
	// 최신 입고 내역 TOP 5
	public List<DashDTO> inTopFive() {
		List<DashDTO> inList = dashMapper.inTopFive();
		return inList;
	}
	
	// 최신 출고 내역 TOP 5
	public List<DashDTO> outTopFive() {
		List<DashDTO> outList = dashMapper.outTopFive();
		return outList;
=======
		// 전월 매출액 구하기
		return dashMapper.befSales(date.getBeforeFirstDate(), date.getBeforeEndDate());
>>>>>>> item
	}
	
	// 명세서 리스트 가져오기
	@Transactional
	public List<DashDTO> billTopFive() {
		List<DashDTO> billList = dashMapper.billTopFiveMeta();
		billList.forEach(bill -> {
			bill.setGbc_amount(dashMapper.billTopFiveAmount(bill.getGbc_gis_list()));
		});
		return billList;
	}
	
}
