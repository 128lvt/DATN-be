    package poly.store.datn.models;
    
    import jakarta.persistence.*;
    import lombok.*;
    import org.apache.catalina.User;
    
    import java.time.LocalDateTime;
    import java.util.Date;
    
    @Entity
    @Table(name ="orders")
    @Getter
    @Setter
    @AllArgsConstructor
    @NoArgsConstructor
    public class Order {
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private Long id;
    
        @ManyToOne
        @JoinColumn(name = "user_id")
        private User user;
    
        @Column(name = "fullname", length = 100)
        private String fullname;
    
        @Column(name = "email", length = 100)
        private String email;
    
        @Column(name = "phone_number",nullable = false, length = 100)
        private String phone_Number;
    
        @Column(name = "address", length = 100)
        private String address;
    
        @Column(name = "note", length = 100)
        private String note;
    
        @Column(name = "order_date")
        private LocalDateTime orderDate;
    
        @Column(name = "status")
        private String status;
    
        @Column(name = "total_money")
        private Integer total_Money;
    
        @Column(name = "shipping_method")
        private String shippingMethod;
    
        @Column(name = "shipping_address")
        private String shippingAddress;
    
        @Column(name = "shipping_date")
        private Date shippingDate;
    
        @Column(name = "tracking_number")
        private String trackingNumber;
    
        @Column(name = "payment_method")
        private String paymentMethod;
    
    
        @Column(name = "acctive")
        private Boolean acctive; // thuoc ve admin
    }
