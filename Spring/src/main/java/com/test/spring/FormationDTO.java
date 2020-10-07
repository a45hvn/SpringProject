package com.test.spring;

import lombok.Data;

@Data
public class FormationDTO {
	//arr[i] = { strategy: strategy, position: position, top: top, left: left, identity: identity, player: player };
	private String strategy;
	private String position_x;
	private String position_y; 
	private String player;
	private String position;
	private String identity;
	private String team_seq;
}