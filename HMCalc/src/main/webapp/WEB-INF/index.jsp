<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/css/main.css"/>
<title>HM Calc</title>
</head>
<body onload="chooseDigimonOne(), chooseDigimonTwo()">
	<div class="new-header">
		<h1>HM Damage Calc</h1>
	</div>
	<div class="container">
		<div class="sm-container">
			<div class="left-side border-box-big">
				<div class="sm-container space">
					<div class="border-box-big pv-box">
						<h2 class="header">PvP</h2>
						<div class="sm-container">
							<div class="move-box space">
								<label>Damage</label>
								<input class="move-box-two" id="verus-player-damage-one" disabled>
							</div>
							<div class="move-box space">
								<label>Percentage</label>
								<input class="move-box-two" id="verus-player-percent-one" disabled>
							</div>
						</div>
					</div>
					<div class="border-box-big pv-box">
						<h2 class="header">PvE</h2>
						<div class="sm-container">
							<div class="move-box space">
								<label>Damage</label>
								<input class="move-box-two" id="verus-enemy-damage-one" disabled>
							</div>
							<div class="move-box space">
								<label>Percentage</label>
								<input class="move-box-two" id="verus-enemy-percent-one" disabled>
							</div>
						</div>
					</div>
				</div>
				<div class="header space">
					<h2>Digimon 1</h2>
				</div>
				<div class="header space">
					<select id="choose-digimon-one" onchange="chooseDigimonOne()">
						<c:forEach var="digimon" items="${digimons}">
							<option
								id="digi-info-one${digimon.id}"
								data-hp="${digimon.hp_stat}"
								data-sp="${digimon.sp_stat}"
								data-atk="${digimon.atk_stat}"
								data-def="${digimon.def_stat}"
								data-int="${digimon.int_stat}"
								data-spd="${digimon.spd_stat}"
								data-royal="${digimon.is_royal}"
								data-items="${digimon.items}"
								data-stage="${digimon.stage.id}"
								data-growth="${digimon.growthType.id}"
								data-type="${digimon.type.id}"
								data-attrib="${digimon.attribute.id}"
								data-supp="${digimon.supportSkill.id}"><c:out value="${digimon.diginame}"/></option>
						</c:forEach>
					</select><br><br>
				</div>
				<div class="sm-container">
					<div class="left-side space box-org">
						<div>
							<label title="Determines how the digimon raises stats">Growth Type</label>
							<select id="growth-select-one" onchange="calcStatsOne()">
								<c:forEach var="growthType" items="${growthTypes}">
									<option><c:out value="${growthType.growthTypeName}"/></option>
								</c:forEach>
							</select>
						</div><br>
						<div>
							<label>Stage</label>
							<select id="stage-select-one" onchange="calcStatsOne()">
								<c:forEach var="stage" items="${stages}">
									<option><c:out value="${stage.stageName}"/></option>
								</c:forEach>
							</select>
						</div><br>
						<div>
							<label>Type</label>
							<select id="type-select-one" onchange="calcStatsOne()">
								<c:forEach var="type" items="${types}">
									<option><c:out value="${type.typeName}"/></option>
								</c:forEach>
							</select>
						</div><br>
						<div>
							<label>Attribute</label>
							<select id="attrib-select-one" onchange="calcStatsOne()">
								<c:forEach var="attribute" items="${attributes}">
									<option><c:out value="${attribute.attributeName}"/></option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="right-side space box-org">
						<div>
							<label>Personality</label>
							<select id="person-select-one" onchange="choosePersonalityOne()">
								<option>N/A</option>
								<option>Durable +5% HP</option>
								<option>Lively +5% SP</option>
								<option>Fighter +5% Atk</option>
								<option>Defender +5% Def</option>
								<option>Brainy +5% Int</option>
								<option>Nimble +5% Spd</option>
							</select>
						</div>
						<br>
						<div>
							<label>Main Support</label>
							<select id="main-supp-select-one" onchange="chooseSupportOne()">
								<c:forEach var="support" items="${supports}">
									<option><c:out value="${support.skillName}"/></option>
								</c:forEach>
							</select>
							<select title="Used to determine bonus ATK% from Gluttony based on turns passed" id="supp-boost-one-one" onchange="calcStatsOne()" disabled>
								<c:forEach var="i" begin="0" end="10">
									<option>${i}</option>
								</c:forEach>
							</select>
						</div>
						<div>
							<label>Support 1</label>
							<select id="supp-select-one-one" onchange="chooseSupportOne()">
								<c:forEach var="support" items="${supports}">
									<option><c:out value="${support.skillName}"/></option>
								</c:forEach>
							</select>
							<select title="Used to determine bonus ATK% from Gluttony based on turns passed" id="supp-boost-two-one" onchange="calcStatsOne()" disabled>
								<c:forEach var="i" begin="0" end="10">
									<option>${i}</option>
								</c:forEach>
							</select>
						</div>
						<div>
							<label>Support 2</label>
							<select id="supp-select-two-one" onchange="chooseSupportOne()">
								<c:forEach var="support" items="${supports}">
									<option><c:out value="${support.skillName}"/></option>
								</c:forEach>
							</select>
							<select title="Used to determine bonus ATK% from Gluttony based on turns passed" id="supp-boost-three-one" onchange="calcStatsOne()" disabled>
								<c:forEach var="i" begin="0" end="10">
									<option>${i}</option>
								</c:forEach>
							</select>
						</div>
						<br>
						<div>
							<label>Item 1</label>
							<select id="item-select-one-one" onchange="chooseItemOne()" disabled>
								<c:forEach var="item" items="${items}">
									<option><c:out value="${item.itemName}"/></option>
								</c:forEach>
							</select>
						</div>
						<div>
							<label>Item 2</label>
							<select id="item-select-two-one" onchange="chooseItemOne()" disabled>
								<c:forEach var="item" items="${items}">
									<option><c:out value="${item.itemName}"/></option>
								</c:forEach>
							</select>
						</div>
						<div>
							<label>Item 3</label>
							<select id="item-select-three-one" onchange="chooseItemOne()" disabled>
								<c:forEach var="item" items="${items}">
									<option><c:out value="${item.itemName}"/></option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<div class="sm-container">
					<div class="left-side">
						<div class="stat-box">
							<div>
								<h3>Attribute Multiplier</h3>
							</div>
							<div class="multi">
								<table>
									<tr>
										<th></th>
										<th title="Damage multiplier when dealing attribute damage to enemies">Offense</th>
										<th title="Damage multiplier when taking attribute damage from enemies">Defense</th>
									</tr>
									<tr>
										<th>Neutral</th>
										<td id="neutral-off-stat-one">100%</td>
										<td id="neutral-def-stat-one">100%</td>
									</tr>
									<tr>
										<th>Fire</th>
										<td id="fire-off-stat-one">100%</td>
										<td id="fire-def-stat-one">100%</td>
									</tr>
									<tr>
										<th>Plant</th>
										<td id="plant-off-stat-one">100%</td>
										<td id="plant-def-stat-one">100%</td>
									</tr>
									<tr>
										<th>Water</th>
										<td id="water-off-stat-one">100%</td>
										<td id="water-def-stat-one">100%</td>
									</tr>
									<tr>
										<th>Electric</th>
										<td id="electric-off-stat-one">100%</td>
										<td id="electric-def-stat-one">100%</td>
									</tr>
									<tr>
										<th>Wind</th>
										<td id="wind-off-stat-one">100%</td>
										<td id="wind-def-stat-one">100%</td>
									</tr>
									<tr>
										<th>Earth</th>
										<td id="earth-off-stat-one">100%</td>
										<td id="earth-def-stat-one">100%</td>
									</tr>
									<tr>
										<th>Light</th>
										<td id="light-off-stat-one">100%</td>
										<td id="light-def-stat-one">100%</td>
									</tr>
									<tr>
										<th>Dark</th>
										<td id="dark-off-stat-one">100%</td>
										<td id="dark-def-stat-one">100%</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					<div class="right-side">
						<div class="stat-box">
							<div>
								<h3>Stats</h3>
							</div>
							<div>
								<table>
									<tr>
										<th></th>
										<th title="Stats for current level">Level</th>
										<th title="Please note that bonus stat total is (200 ABI / 2) + 50, or 150">Bonus</th>
										<th title="Stats from equipped items">Item</th>
										<th title="Stat multiplier from Support Skills">Support</th>
										<th title="Stat multiplier from buffs or debuffs">Buff</th>
										<th title="Final stats that factors all changes">Current</th>
									</tr>
									<tr>
										<th>HP</th>
										<td><input type="number" id="hp-level-stat-one" value="1000" max="9990" step="10" onchange="chooseLevelOne()"></td>
										<td><input type="number" id="hp-bonus-stat-one" value="0" max="1500" step="10" onchange="chooseBonusOne()"></td>
										<td class="border-box"><label id="hp-item-stat-one">0</label></td>
										<td></td>
										<td></td>
										<td><label id="hp-current-stat-one">0</label></td>
									</tr>
									<tr>
										<th>SP</th>
										<td><input type="number" id="sp-level-stat-one" value="100" max="999" onchange="chooseLevelOne()"></td>
										<td><input type="number" id="sp-bonus-stat-one" value="0" max="150" onchange="chooseBonusOne()"></td>
										<td class="border-box"><label id="sp-item-stat-one">0</label></td>
										<td></td>
										<td></td>
										<td><label id="sp-current-stat-one">0</label></td>
									</tr>
									<tr>
										<th>Attack</th>
										<td><input type="number" id="atk-level-stat-one" value="100" max="999" onchange="chooseLevelOne()"></td>
										<td><input type="number" id="atk-bonus-stat-one" value="0" max="150" onchange="chooseBonusOne()"></td>
										<td class="border-box"><label id="atk-item-stat-one">0</label></td>
										<td class="border-box"><label id="atk-supp-stat-one">0%</label></td>
										<td>
											<select id="atk-buff-select-one" onchange="calcStatsOne()">
												<option value="-5">-5</option>
												<option value="-4">-4</option>
												<option value="-3">-3</option>
												<option value="-2">-2</option>
												<option value="-1">-1</option>
												<option value="0" selected="selected">0</option>
												<option value="+1">+1</option>
												<option value="+2">+2</option>
												<option value="+3">+3</option>
												<option value="+4">+4</option>
												<option value="+5">+5</option>
												<option value="+6">+6</option>
												<option value="+7">+7</option>
												<option value="+8">+8</option>
												<option value="+9">+9</option>
												<option value="+10">+10</option>
											</select>
										</td>
										<td><label id="atk-current-stat-one">0</label></td>
									</tr>
									<tr>
										<th>Defense</th>
										<td><input type="number" id="def-level-stat-one" value="100" max="999" onchange="chooseLevelOne()"></td>
										<td><input type="number" id="def-bonus-stat-one" value="0" max="150" onchange="chooseBonusOne()"></td>
										<td class="border-box"><label id="def-item-stat-one">0</label></td>
										<td class="border-box"><label id="def-supp-stat-one">0%</label></td>
										<td>
											<select id="def-buff-select-one" onchange="calcStatsOne()">
												<option value="-5">-5</option>
												<option value="-4">-4</option>
												<option value="-3">-3</option>
												<option value="-2">-2</option>
												<option value="-1">-1</option>
												<option value="0" selected="selected">0</option>
												<option value="+1">+1</option>
												<option value="+2">+2</option>
												<option value="+3">+3</option>
												<option value="+4">+4</option>
												<option value="+5">+5</option>
												<option value="+6">+6</option>
												<option value="+7">+7</option>
												<option value="+8">+8</option>
												<option value="+9">+9</option>
												<option value="+10">+10</option>
											</select>
										</td>
										<td><label id="def-current-stat-one">0</label></td>
									</tr>
									<tr>
										<th>Intellect</th>
										<td><input type="number" id="int-level-stat-one" value="100" max="999" onchange="chooseLevelOne()"></td>
										<td><input type="number" id="int-bonus-stat-one" value="0" max="150" onchange="chooseBonusOne()"></td>
										<td class="border-box"><label id="int-item-stat-one">0</label></td>
										<td class="border-box"><label id="int-supp-stat-one">0%</label></td>
										<td>
											<select id="int-buff-select-one" onchange="calcStatsOne()">
												<option value="-5">-5</option>
												<option value="-4">-4</option>
												<option value="-3">-3</option>
												<option value="-2">-2</option>
												<option value="-1">-1</option>
												<option value="0" selected="selected">0</option>
												<option value="+1">+1</option>
												<option value="+2">+2</option>
												<option value="+3">+3</option>
												<option value="+4">+4</option>
												<option value="+5">+5</option>
												<option value="+6">+6</option>
												<option value="+7">+7</option>
												<option value="+8">+8</option>
												<option value="+9">+9</option>
												<option value="+10">+10</option>
											</select>
										</td>
										<td><label id="int-current-stat-one">0</label></td>
									</tr>
									<tr>
										<th>Speed</th>
										<td><input type="number" id="spd-level-stat-one" value="100" max="999" onchange="chooseLevelOne()"></td>
										<td><input type="number" id="spd-bonus-stat-one" value="0" max="150" onchange="chooseBonusOne()"></td>
										<td class="border-box"><label id="spd-item-stat-one">0</label></td>
										<td class="border-box"><label id="spd-supp-stat-one">0%</label></td>
										<td>
											<select id="spd-buff-select-one" onchange="calcStatsOne()">
												<option value="-5">-5</option>
												<option value="-4">-4</option>
												<option value="-3">-3</option>
												<option value="-2">-2</option>
												<option value="-1">-1</option>
												<option value="0" selected="selected">0</option>
												<option value="+1">+1</option>
												<option value="+2">+2</option>
												<option value="+3">+3</option>
												<option value="+4">+4</option>
												<option value="+5">+5</option>
												<option value="+6">+6</option>
												<option value="+7">+7</option>
												<option value="+8">+8</option>
												<option value="+9">+9</option>
												<option value="+10">+10</option>
											</select>
										</td>
										<td><label id="spd-current-stat-one">0</label></td>
									</tr>
								</table>
							</div>
						</div><br>
						<div class="sm-container">
							<div class="box-org">
								<div class="tiny-space">
									<label class="bold-text" title="Damage multiplier when dealing damage to enemies">Give DMG</label>
									<p class="text-box" id="give-dmg-stat-one">100%</p>
								</div>
								<div>
									<label class="bold-text" title="Damage multiplier when taking damage from enemies">Take DMG</label>
									<label class="text-box" id="take-dmg-stat-one">100%</label>
								</div>
							</div>
							<div class="box-org">
								<div class="tiny-space">
									<label class="bold-text" title="Damage multiplier when taking physical damage from enemies">Phy DMG</label>
									<label class="text-box" id="phy-dmg-stat-one">100%</label>
								</div>
								<div>
									<label class="bold-text" title="Damage multiplier when taking magical damage from enemies">Mag DMG</label>
									<label class="text-box" id="mag-dmg-stat-one">100%</label>
								</div>
							</div>
							<div class="box-org">
								<div>
									<label class="bold-text" title="Damage multiplier when taking penetrating damage from enemies">Pen DMG</label>
									<label class="text-box" id="pen-dmg-stat-one">100%</label>
								</div>
							</div>
						</div>
						<div class="vert-space">
							<div class="hp-box">
								<label>Current HP</label>
								<input type="number" class="text-box" id="current-health-one" value="1000" onchange="chooseCurrentHealthOne()">/<span id="max-health-one">1000</span> (<input type="number" class="text-box" id="percent-health-one" value="100" onchange="choosePercentOne()">%)
							</div>
							<div class="hp-box">
								<label>Health</label>
								<div class="hp-bar" id="health-bar-one">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="sm-container">
					<div class="space border-box-big">
						<div class="header">
							<h4>Move</h4>
						</div>
						<div class="sm-container">
							<div>
								<div class="sm-container space">
									<div class="space-side">
										<label title="Power for regular attacks/counters is 50 and are considered Physical">Power</label>
										<input type="number" id="move-power-one" class="text-box" value="50" max="250" onchange="chooseMovePowerOne()"></input>
									</div>
									<div class="space-side">
										<label title="Attribute for regular attacks/counters matches the Digimon's attribute. EX: Agumon's basic attack is considered FIRE">Attribute</label>
										<select id="move-attrib-one" onchange="calcStatsOne()">
											<c:forEach var="attribute" items="${attributes}">
												<option><c:out value="${attribute.attributeName}"/></option>
											</c:forEach>
										</select>
									</div>
									<div class="space-side">
										<label>Type</label>
										<select id="move-type-one" onchange="calcStatsOne()">
												<option>Physical</option>
												<option>Magical</option>
										</select>
									</div>
								</div>
								<div class="sm-container space">
									<div class="space-side">
										<label>Hits</label>
										<select id="move-hits-one" onchange="calcStatsOne()">
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
												<option value="6">6</option>
												<option value="7">7</option>
												<option value="8">8</option>
												<option value="9">9</option>
										</select>
									</div>
									<div class="space-side">
										<label title="Penetrate damage is based on a multiplier using the attacker's ATK/INT stat, ignoring the enemy's DEF/INT stat">Penetrate</label>
										<select id="move-penetrate-one" onchange="calcStatsOne()">
												<option>N/A</option>
												<option>Medium (1x)</option>
												<option>Strong (1.7x)</option>
												<option>Very Strong (2.5x)</option>
										</select>
									</div>
									<div class="space-side">
										<label title="Damage multiplier if Cross Combo is activated. Please note that the multipler is random between one of the values listed">Cross Combo</label>
										<select id="move-combo-one" onchange="calcStatsOne()">
												<option>N/A</option>
												<option>1.5x</option>
												<option>1.75x</option>
												<option>1.87x</option>
												<option>1.93x</option>
												<option>1.98x</option>
												<option>1.99x</option>
												<option>2x</option>
										</select>
									</div>
								</div>
							</div>
							<div class="box-org">
								<div class="checkbox space">
									<label>
										<input type="checkbox" title="Damage Multiplier for Critical Hits is 1.5x" id="crit-btn-one" onchange="calcStatsOne()"><span class="checkbox-space">Critical Hit</span>
									</label>
								</div>
								<div class="checkbox">
									<label>
										<input type="checkbox" title="Damage Multiplier for Accel Boost is 2x" id="accel-btn-one" onchange="calcStatsOne()"><span class="checkbox-space">Accel Boost</span>
									</label>
								</div>		
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="right-side border-box-big">
				<div class="sm-container space">
					<div class="border-box-big pv-box">
						<h2 class="header">PvP</h2>
						<div class="sm-container">
							<div class="move-box space">
								<label>Damage</label>
								<input class="move-box-two" id="verus-player-damage-two" disabled>
							</div>
							<div class="move-box space">
								<label>Percentage</label>
								<input class="move-box-two" id="verus-player-percent-two" disabled>
							</div>
						</div>
					</div>
					<div class="border-box-big pv-box">
						<h2 class="header">PvE</h2>
						<div class="sm-container">
							<div class="move-box space">
								<label>Damage</label>
								<input class="move-box-two" id="verus-enemy-damage-two" disabled>
							</div>
							<div class="move-box space">
								<label>Percentage</label>
								<input class="move-box-two" id="verus-enemy-percent-two" disabled>
							</div>
						</div>
					</div>
				</div>
				<div class="header space">
					<h2>Digimon 2</h2>
				</div>
				<div class="header space">
					<select id="choose-digimon-two" onchange="chooseDigimonTwo()">
						<c:forEach var="digimon" items="${digimons}">
							<option
								id="digi-info-two${digimon.id}"
								data-hp="${digimon.hp_stat}"
								data-sp="${digimon.sp_stat}"
								data-atk="${digimon.atk_stat}"
								data-def="${digimon.def_stat}"
								data-int="${digimon.int_stat}"
								data-spd="${digimon.spd_stat}"
								data-royal="${digimon.is_royal}"
								data-items="${digimon.items}"
								data-stage="${digimon.stage.id}"
								data-growth="${digimon.growthType.id}"
								data-type="${digimon.type.id}"
								data-attrib="${digimon.attribute.id}"
								data-supp="${digimon.supportSkill.id}"><c:out value="${digimon.diginame}"/></option>
						</c:forEach>
					</select><br><br>
				</div>
				<div class="sm-container">
					<div class="left-side space box-org">
						<div>
							<label title="Determines how the digimon raises stats">Growth Type</label>
							<select id="growth-select-two" onchange="calcStatsTwo()">
								<c:forEach var="growthType" items="${growthTypes}">
									<option><c:out value="${growthType.growthTypeName}"/></option>
								</c:forEach>
							</select>
						</div><br>
						<div>
							<label>Stage</label>
							<select id="stage-select-two" onchange="calcStatsTwo()">
								<c:forEach var="stage" items="${stages}">
									<option><c:out value="${stage.stageName}"/></option>
								</c:forEach>
							</select>
						</div><br>
						<div>
							<label>Type</label>
							<select id="type-select-two" onchange="calcStatsTwo()">
								<c:forEach var="type" items="${types}">
									<option><c:out value="${type.typeName}"/></option>
								</c:forEach>
							</select>
						</div><br>
						<div>
							<label>Attribute</label>
							<select id="attrib-select-two" onchange="calcStatsTwo()">
								<c:forEach var="attribute" items="${attributes}">
									<option><c:out value="${attribute.attributeName}"/></option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="right-side space box-org">
						<div>
							<label>Personality</label>
							<select id="person-select-two" onchange="choosePersonalityTwo()">
								<option>N/A</option>
								<option>Durable +5% HP</option>
								<option>Lively +5% SP</option>
								<option>Fighter +5% Atk</option>
								<option>Defender +5% Def</option>
								<option>Brainy +5% Int</option>
								<option>Nimble +5% Spd</option>
							</select>
						</div>
						<br>
						<div>
							<label>Main Support</label>
							<select id="main-supp-select-two" onchange="chooseSupportTwo()">
								<c:forEach var="support" items="${supports}">
									<option><c:out value="${support.skillName}"/></option>
								</c:forEach>
							</select>
							<select title="Used to determine bonus ATK% from Gluttony based on turns passed" id="supp-boost-one-two" onchange="calcStatsTwo()" disabled>
								<c:forEach var="i" begin="0" end="10">
									<option>${i}</option>
								</c:forEach>
							</select>
						</div>
						<div>
							<label>Support 1</label>
							<select id="supp-select-one-two" onchange="chooseSupportTwo()">
								<c:forEach var="support" items="${supports}">
									<option><c:out value="${support.skillName}"/></option>
								</c:forEach>
							</select>
							<select title="Used to determine bonus ATK% from Gluttony based on turns passed" id="supp-boost-two-two" onchange="calcStatsTwo()" disabled>
								<c:forEach var="i" begin="0" end="10">
									<option>${i}</option>
								</c:forEach>
							</select>
						</div>
						<div>
							<label>Support 2</label>
							<select id="supp-select-two-two" onchange="chooseSupportTwo()">
								<c:forEach var="support" items="${supports}">
									<option><c:out value="${support.skillName}"/></option>
								</c:forEach>
							</select>
							<select title="Used to determine bonus ATK% from Gluttony based on turns passed" id="supp-boost-three-two" onchange="calcStatsTwo()" disabled>
								<c:forEach var="i" begin="0" end="10">
									<option>${i}</option>
								</c:forEach>
							</select>
						</div>
						<br>
						<div>
							<label>Item 1</label>
							<select id="item-select-one-two" onchange="chooseItemTwo()" disabled>
								<c:forEach var="item" items="${items}">
									<option><c:out value="${item.itemName}"/></option>
								</c:forEach>
							</select>
						</div>
						<div>
							<label>Item 2</label>
							<select id="item-select-two-two" onchange="chooseItemTwo()" disabled>
								<c:forEach var="item" items="${items}">
									<option><c:out value="${item.itemName}"/></option>
								</c:forEach>
							</select>
						</div>
						<div>
							<label>Item 3</label>
							<select id="item-select-three-two" onchange="chooseItemTwo()" disabled>
								<c:forEach var="item" items="${items}">
									<option><c:out value="${item.itemName}"/></option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<div class="sm-container">
					<div class="left-side">
						<div class="stat-box">
							<div>
								<h3>Attribute Multiplier</h3>
							</div>
							<div class="multi">
								<table>
									<tr>
										<th></th>
										<th title="Damage multiplier when dealing attribute damage to enemies">Offense</th>
										<th title="Damage multiplier when taking attribute damage from enemies">Defense</th>
									</tr>
									<tr>
										<th>Neutral</th>
										<td id="neutral-off-stat-two">100%</td>
										<td id="neutral-def-stat-two">100%</td>
									</tr>
									<tr>
										<th>Fire</th>
										<td id="fire-off-stat-two">100%</td>
										<td id="fire-def-stat-two">100%</td>
									</tr>
									<tr>
										<th>Plant</th>
										<td id="plant-off-stat-two">100%</td>
										<td id="plant-def-stat-two">100%</td>
									</tr>
									<tr>
										<th>Water</th>
										<td id="water-off-stat-two">100%</td>
										<td id="water-def-stat-two">100%</td>
									</tr>
									<tr>
										<th>Electric</th>
										<td id="electric-off-stat-two">100%</td>
										<td id="electric-def-stat-two">100%</td>
									</tr>
									<tr>
										<th>Wind</th>
										<td id="wind-off-stat-two">100%</td>
										<td id="wind-def-stat-two">100%</td>
									</tr>
									<tr>
										<th>Earth</th>
										<td id="earth-off-stat-two">100%</td>
										<td id="earth-def-stat-two">100%</td>
									</tr>
									<tr>
										<th>Light</th>
										<td id="light-off-stat-two">100%</td>
										<td id="light-def-stat-two">100%</td>
									</tr>
									<tr>
										<th>Dark</th>
										<td id="dark-off-stat-two">100%</td>
										<td id="dark-def-stat-two">100%</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					<div class="right-side">
						<div class="stat-box">
							<div>
								<h3>Stats</h3>
							</div>
							<div>
								<table>
									<tr>
										<th></th>
										<th title="Stats for current level">Level</th>
										<th title="Please note that bonus stat total is (200 ABI / 2) + 50, or 150">Bonus</th>
										<th title="Stats from equipped items">Item</th>
										<th title="Stat multiplier from Support Skills">Support</th>
										<th title="Stat multiplier from buffs or debuffs">Buff</th>
										<th title="Final stats that factors all changes">Current</th>
									</tr>
									<tr>
										<th>HP</th>
										<td><input type="number" id="hp-level-stat-two" value="1000" max="9990" step="10" onchange="chooseLevelTwo()"></td>
										<td><input type="number" id="hp-bonus-stat-two" value="0" max="1500" step="10" onchange="chooseBonusTwo()"></td>
										<td class="border-box"><label id="hp-item-stat-two">0</label></td>
										<td></td>
										<td></td>
										<td><label id="hp-current-stat-two">0</label></td>
									</tr>
									<tr>
										<th>SP</th>
										<td><input type="number" id="sp-level-stat-two" value="100" max="999" onchange="chooseLevelTwo()"></td>
										<td><input type="number" id="sp-bonus-stat-two" value="0" max="150" onchange="chooseBonusTwo()"></td>
										<td class="border-box"><label id="sp-item-stat-two">0</label></td>
										<td></td>
										<td></td>
										<td><label id="sp-current-stat-two">0</label></td>
									</tr>
									<tr>
										<th>Attack</th>
										<td><input type="number" id="atk-level-stat-two" value="100" max="999" onchange="chooseLevelTwo()"></td>
										<td><input type="number" id="atk-bonus-stat-two" value="0" max="150" onchange="chooseBonusTwo()"></td>
										<td class="border-box"><label id="atk-item-stat-two">0</label></td>
										<td class="border-box"><label id="atk-supp-stat-two">0%</label></td>
										<td>
											<select id="atk-buff-select-two" onchange="calcStatsTwo()">
												<option value="-5">-5</option>
												<option value="-4">-4</option>
												<option value="-3">-3</option>
												<option value="-2">-2</option>
												<option value="-1">-1</option>
												<option value="0" selected="selected">0</option>
												<option value="+1">+1</option>
												<option value="+2">+2</option>
												<option value="+3">+3</option>
												<option value="+4">+4</option>
												<option value="+5">+5</option>
												<option value="+6">+6</option>
												<option value="+7">+7</option>
												<option value="+8">+8</option>
												<option value="+9">+9</option>
												<option value="+10">+10</option>
											</select>
										</td>
										<td><label id="atk-current-stat-two">0</label></td>
									</tr>
									<tr>
										<th>Defense</th>
										<td><input type="number" id="def-level-stat-two" value="100" max="999" onchange="chooseLevelTwo()"></td>
										<td><input type="number" id="def-bonus-stat-two" value="0" max="150" onchange="chooseBonusTwo()"></td>
										<td class="border-box"><label id="def-item-stat-two">0</label></td>
										<td class="border-box"><label id="def-supp-stat-two">0%</label></td>
										<td>
											<select id="def-buff-select-two" onchange="calcStatsTwo()">
												<option value="-5">-5</option>
												<option value="-4">-4</option>
												<option value="-3">-3</option>
												<option value="-2">-2</option>
												<option value="-1">-1</option>
												<option value="0" selected="selected">0</option>
												<option value="+1">+1</option>
												<option value="+2">+2</option>
												<option value="+3">+3</option>
												<option value="+4">+4</option>
												<option value="+5">+5</option>
												<option value="+6">+6</option>
												<option value="+7">+7</option>
												<option value="+8">+8</option>
												<option value="+9">+9</option>
												<option value="+10">+10</option>
											</select>
										</td>
										<td><label id="def-current-stat-two">0</label></td>
									</tr>
									<tr>
										<th>Intellect</th>
										<td><input type="number" id="int-level-stat-two" value="100" max="999" onchange="chooseLevelTwo()"></td>
										<td><input type="number" id="int-bonus-stat-two" value="0" max="150" onchange="chooseBonusTwo()"></td>
										<td class="border-box"><label id="int-item-stat-two">0</label></td>
										<td class="border-box"><label id="int-supp-stat-two">0%</label></td>
										<td>
											<select id="int-buff-select-two" onchange="calcStatsTwo()">
												<option value="-5">-5</option>
												<option value="-4">-4</option>
												<option value="-3">-3</option>
												<option value="-2">-2</option>
												<option value="-1">-1</option>
												<option value="0" selected="selected">0</option>
												<option value="+1">+1</option>
												<option value="+2">+2</option>
												<option value="+3">+3</option>
												<option value="+4">+4</option>
												<option value="+5">+5</option>
												<option value="+6">+6</option>
												<option value="+7">+7</option>
												<option value="+8">+8</option>
												<option value="+9">+9</option>
												<option value="+10">+10</option>
											</select>
										</td>
										<td><label id="int-current-stat-two">0</label></td>
									</tr>
									<tr>
										<th>Speed</th>
										<td><input type="number" id="spd-level-stat-two" value="100" max="999" onchange="chooseLevelTwo()"></td>
										<td><input type="number" id="spd-bonus-stat-two" value="0" max="150" onchange="chooseBonusTwo()"></td>
										<td class="border-box"><label id="spd-item-stat-two">0</label></td>
										<td class="border-box"><label id="spd-supp-stat-two">0%</label></td>
										<td>
											<select id="spd-buff-select-two" onchange="calcStatsTwo()">
												<option value="-5">-5</option>
												<option value="-4">-4</option>
												<option value="-3">-3</option>
												<option value="-2">-2</option>
												<option value="-1">-1</option>
												<option value="0" selected="selected">0</option>
												<option value="+1">+1</option>
												<option value="+2">+2</option>
												<option value="+3">+3</option>
												<option value="+4">+4</option>
												<option value="+5">+5</option>
												<option value="+6">+6</option>
												<option value="+7">+7</option>
												<option value="+8">+8</option>
												<option value="+9">+9</option>
												<option value="+10">+10</option>
											</select>
										</td>
										<td><label id="spd-current-stat-two">0</label></td>
									</tr>
								</table>
							</div>
						</div><br>
						<div class="sm-container">
							<div class="box-org">
								<div class="tiny-space">
									<label class="bold-text" title="Damage multiplier when dealing damage to enemies">Give DMG</label>
									<p class="text-box" id="give-dmg-stat-two">100%</p>
								</div>
								<div>
									<label class="bold-text" title="Damage multiplier when taking damage from enemies">Take DMG</label>
									<label class="text-box" id="take-dmg-stat-two">100%</label>
								</div>
							</div>
							<div class="box-org">
								<div class="tiny-space">
									<label class="bold-text" title="Damage multiplier when taking physical damage from enemies">Phy DMG</label>
									<label class="text-box" id="phy-dmg-stat-two">100%</label>
								</div>
								<div>
									<label class="bold-text" title="Damage multiplier when taking magical damage from enemies">Mag DMG</label>
									<label class="text-box" id="mag-dmg-stat-two">100%</label>
								</div>
							</div>
							<div class="box-org">
								<div>
									<label class="bold-text" title="Damage multiplier when taking penetrating damage from enemies">Pen DMG</label>
									<label class="text-box" id="pen-dmg-stat-two">100%</label>
								</div>
							</div>
						</div>
						<div class="vert-space">
							<div class="hp-box">
								<label>Current HP</label>
								<input type="number" class="text-box" id="current-health-two" value="1000" onchange="chooseCurrentHealthTwo()">/<span id="max-health-two">1000</span> (<input type="number" class="text-box" id="percent-health-two" value="100" onchange="choosePercentTwo()">%)
							</div>
							<div class="hp-box">
								<label>Health</label>
								<div class="hp-bar" id="health-bar-two">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="sm-container">
					<div class="space border-box-big">
						<div class="header">
							<h4>Move</h4>
						</div>
						<div class="sm-container">
							<div>
								<div class="sm-container space">
									<div class="space-side">
										<label title="Power for regular attacks/counters is 50 and are considered Physical">Power</label>
										<input type="number" id="move-power-two" class="text-box" value="50" max="250" onchange="chooseMovePowerTwo()"></input>
									</div>
									<div class="space-side">
										<label title="Attribute for regular attacks/counters matches the Digimon's attribute. EX: Agumon's basic attack is considered FIRE">Attribute</label>
										<select id="move-attrib-two" onchange="calcStatsTwo()">
											<c:forEach var="attribute" items="${attributes}">
												<option><c:out value="${attribute.attributeName}"/></option>
											</c:forEach>
										</select>
									</div>
									<div class="space-side">
										<label>Type</label>
										<select id="move-type-two" onchange="calcStatsTwo()">
												<option>Physical</option>
												<option>Magical</option>
										</select>
									</div>
								</div>
								<div class="sm-container space">
									<div class="space-side">
										<label>Hits</label>
										<select id="move-hits-two" onchange="calcStatsTwo()">
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
												<option value="6">6</option>
												<option value="7">7</option>
												<option value="8">8</option>
												<option value="9">9</option>
										</select>
									</div>
									<div class="space-side">
										<label title="Penetrate damage is based on a multiplier using the attacker's ATK/INT stat, ignoring the enemy's DEF/INT stat">Penetrate</label>
										<select id="move-penetrate-two" onchange="calcStatsTwo()">
												<option>N/A</option>
												<option>Medium (1x)</option>
												<option>Strong (1.7x)</option>
												<option>Very Strong (2.5x)</option>
										</select>
									</div>
									<div class="space-side">
										<label title="Damage multiplier if Cross Combo is activated. Please note that the multipler is random between one of the values listed">Cross Combo</label>
										<select id="move-combo-two" onchange="calcStatsTwo()">
												<option>N/A</option>
												<option>1.5x</option>
												<option>1.75x</option>
												<option>1.87x</option>
												<option>1.93x</option>
												<option>1.98x</option>
												<option>1.99x</option>
												<option>2x</option>
										</select>
									</div>
								</div>
							</div>
							<div class="box-org">
								<div class="checkbox space">
									<label>
										<input type="checkbox" title="Damage Multiplier for Critical Hits is 1.5x" id="crit-btn-two" onchange="calcStatsTwo()"><span class="checkbox-space">Critical Hit</span>
									</label>
								</div>
								<div class="checkbox">
									<label>
										<input type="checkbox" title="Damage Multiplier for Accel Boost is 2x" id="accel-btn-two" onchange="calcStatsTwo()"><span class="checkbox-space">Accel Boost</span>
									</label>
								</div>		
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
   	 <script src="js/script.js"></script>
</body>
</html>