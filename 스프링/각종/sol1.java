@Service
public class OrderService {
    private final OrderRepository orderRepository;
    private final PaymentService paymentService;

    public void processOrder(Long orderId) {
        Order order = orderRepository.findById(orderId);
        paymentService.processPayment(order);  // 결제 처리
        order.markAsPaid();
        orderRepository.save(order);           // 주문 상태 저장
    }
}
