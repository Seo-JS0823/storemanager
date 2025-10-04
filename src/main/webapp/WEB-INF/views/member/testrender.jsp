<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>
<body>
  <button id="1234">테스트1</button>
  <div id="parent"></div>
<script src="js/render.js"></script>
<script>
  const test1 = document.getElementById('1234');

  Render.setComponent('address', (data) => {
    const tag = document.createElement('div');
    tag.innerHTML = `
    <div>${data.roadAddr}</div>
    `;

    tag.addEventListener('click', () => {
      console.log(`${data.roadAddr} 을 선택하였습니다.`);
    });

    return tag;
  });

  test1.addEventListener('click', () => {
    Render.callJSON('https://business.juso.go.kr/addrlink/addrLinkApi.do', {
      confmKey:'devU01TX0FVVEgyMDI1MTAwMTExMDUxNzExNjI5Njg=',
      resultType:'json',
      currentPage:1,
      countPerPage:8,
      keyword:'못골번영로'
    }, 
    'parent',
    (item) => Render.getComponent('address', item), 
    'results.juso')
  });
</script>
</body>
</html>