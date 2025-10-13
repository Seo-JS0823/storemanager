<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="listArea"></div>

<div id="pgArea"></div>
<script src="/js/render.js"></script>
<script src="/js/paging.js"></script>
<script>
const manager = new PagingManager();
const url = '/paging';
const BLOCK_SIZE = 5;
listRender(1);
function listRender(page) {
	manager.nowPage = page;
	
	Render.callJSON(
	url,
	{
		nowPage:manager.nowPage
	},
	'listArea',
	(json) => {
		const listArea = document.getElementById('listArea');
		listArea.innerHTML = '';
		const list = json.list;
		list.forEach(item => {
			const div = document.createElement('div');
			div.innerHTML = `
			<div>\${item.gcm_code}</div>
			`;
			listArea.appendChild(div);
		});
		
		const totalPage = json.pg.totalPage;
		manager.renderer({
			start  : 'start',
			middle : 'middle',
			end    : 'end'
		},
		'pgArea',
		totalPage,
		BLOCK_SIZE);
	});
}
manager.setComponent('start', (data) => {
	const div = document.createElement('div');
	div.textContent = '◀';
	
	const backPage = data.start - data.pageSize;
	
	if (data.start <= 1) {
		div.style.opacity = '0.3';
		div.style.cursor = 'default';
		return div;
	}
	
	div.addEventListener('click', () => {
		listRender(backPage);
	});
	
	return div;
})
manager.setComponent('middle', (data) => {
	const div = document.createElement('div');
	div.textContent = `\${data.currentPage}`;
	
	if (data.currentPage === data.activePage) {
		div.style.fontWeight = 'bold';
		div.style.color = '#00AA00';
		div.style.fontSize = '1.5rem';
    }

    div.addEventListener('click', () => {
		listRender(data.currentPage);
    });
	return div;
})
manager.setComponent('end', (data) => {
	const div = document.createElement('div');
	div.textContent = '▶';
	
	const nextPage = data.end + 1;
	
	if(nextPage > data.totalPage) {
		div.style.opacity = '0.3';
		div.style.cursor = 'default';
		return div;
	}
	
	div.addEventListener('click', () => {
		listRender(nextPage);
	});
	
	return div;
})
</script>
</body>
</html>