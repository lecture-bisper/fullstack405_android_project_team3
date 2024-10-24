package bitcfull.moodo_spring.model;


import bitcfull.moodo_spring.MoodoSpringApplication;
import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;

import java.time.LocalDateTime;
import java.util.Date;

@Getter @Setter
@Entity
@Table(name = "moodo_todo")
public class MooDoTodo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idx; // 글번호 (고유식별자)

    @ManyToOne(fetch = FetchType.EAGER) // id 나머지값 받아와줌
    @JoinColumn(name = "user_id", nullable = false)
    private MooDoUser user; // 조인

    @Column(nullable = false, length = 400, name = "td_list")
    private String tdList; // 할일 목록

    @Column(nullable = false)
    private Date startDate; // 일정 시작일

    @Column(nullable = false)
    private Date endDate; // 일정 마지막일

    // Boolean으로 할 경우, Service 내 if문에서 에러 발생
    // 길이 1의 String으로 형변환 및 기본값 N으로 설정
    @Column(nullable = false, length = 1)
    private String tdCheck = "N"; // 할일 완료 여부

    @Column(nullable = false)
    private Date createdDate; // 작성일
}
