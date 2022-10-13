package com.youprice.onion.dto.member;

import com.youprice.onion.entity.member.Member;
import lombok.Getter;

import java.io.Serializable;

@Getter
public class MemberSessionDTO implements Serializable { //인증된 사용자 정보를 세션에 저장하기 위한 클래스
    //엔티티 클래스에 직렬화를 해준다면 추후에 다른 엔티티와 연관관계를 맺을 시,
    //직렬화 대상에 다른 엔티티까지 포함될 수 있어 성능 이슈, 부수 효과 우려가 있음

    private Long id;
    private String userId;
    private String name;
    private String nickname;
    private String tel;
    private String email;
    private String memberImageName;

    //Entity -> DTO
    public MemberSessionDTO(Member member) {
        this.id = member.getId();
        this.userId = member.getUserId();
        this.name = member.getName();
        this.nickname = member.getNickname();
        this.tel = member.getTel();
        this.email = member.getEmail();
        this.memberImageName = member.getMemberImageName();
    }
}
