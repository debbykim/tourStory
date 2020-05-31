<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <h2 class="text-center-mobile notice_mainTitle" style="margin-bottom: 5px;">내 정보</h2>
          <div class="inner">
            <table>
              <tbody>
                <tr>
                  <th style="width: 120px; text-align: center;">이름</th>
                  <td>${sessionScope.nick}<input type="hidden" id="nickname" name="member_nickname" value="${sessionScope.nick}"></td>
                </tr>
                <tr>
                  <th style="text-align: center;">아이디</th>
                  <td>${sessionScope.id}</td>
                </tr>
                <tr>
                  <th style="text-align: center;">암호 입력</th>
                  <td><input type="password" name="member_pass" id="b_password"/></td>
                </tr>
                <tr>
                  <th style="text-align: center;">암호 재입력</th>
                  <td id="repassLabel"><input type="password" id="re_password"/></td>
                </tr>
                <tr>
                  <th style="text-align: center;">이메일</th>
                  <td>${sessionScope.email}</td>
                </tr>
                <tr>
                  <td></td>
                  <td><button style="float: right;margin-right: 50px;width: 100px;height: 60px;" id="upPassBtn">수정하기</button></td>
                </tr>
              </tbody>
            </table>
          </div>