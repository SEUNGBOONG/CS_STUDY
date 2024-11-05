package com.example.investment_api.virtual.order.controller.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderRequest {
    private Long memberId;        // 회원 ID
    private String stockName;     // 주식 이름
    private int quantity;         // 주문 수량
    private int price;            // 가격 (현재가 또는 지정가)
    private String orderType;     // 주문 유형 ("BUY" 또는 "SELL")
}
