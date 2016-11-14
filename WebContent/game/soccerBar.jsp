<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
    
<table align="center">
		<tr>
			<td>맞대결팀 선택 :</td>
			<td>
				<select name="league" onchange="">
					<option value="K리그" >리그</option>
					<option value="K리그" selected="selected">K리그 클래식</option>
				</select>
				<select name="home">
					<option value="전북" selected="selected">전북</option>
					<option value="수원">수원</option>		
					<option value="전남">전남</option>
					<option value="서울">서울</option>
					<option value="포항">포항</option>
					<option value="성남">성남</option>
					<option value="인천">인천</option>
					<option value="제주">제주</option>
					<option value="광주">광주</option>
					<option value="울산">울산</option>
					<option value="부산">부산</option>
					<option value="대전">대전</option>	
				</select>
				vs
				<select name="away">
					<option value="수원" selected="selected">수원</option>
					<option value="전북">전북</option>	
					<option value="전남">전남</option>
					<option value="서울">서울</option>
					<option value="포항">포항</option>
					<option value="성남">성남</option>
					<option value="인천">인천</option>
					<option value="제주">제주</option>
					<option value="광주">광주</option>
					<option value="울산">울산</option>
					<option value="부산">부산</option>
					<option value="대전">대전</option>	
				</select>
			</td>
			<td>&nbsp;&nbsp;&nbsp;<input type="submit" value="전송" /></td>
		</tr>
			
	</table>