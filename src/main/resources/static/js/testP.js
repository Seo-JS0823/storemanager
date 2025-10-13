class PGRD {
  constructor() {
    this.components = {};
    this._nowPage = 1;
  }

  setComponent(name, html) {
    this.components[name] = html;
  }
  getComponent(name, data) {
    const component = this.components[name];
    return component(data);
  }

  set json(jsonData) {
    this._jsonData = jsonData;
  }
  get json() {
	return this._jsonData;
  }

  set nowPage(nowPage) {
    this._nowPage = nowPage;
  }
  get nowPage() {
    return this._nowPage;
  }
  
  rendering(component, id, data) {
    const pageSize = 5;
    
    const totalPage = data.totalPage;
    console.log(totalPage);
    const startPage = Math.floor((this.nowPage - 1) / pageSize) * pageSize + 1;
    const endPage = Math.min(startPage + pageSize - 1, totalPage);

    const renderT = document.getElementById(id);
    renderT.innerHTML = '';

    // ◀
    renderT.appendChild(this.getComponent(component.start, {
      totalPage:totalPage,
      pageSize:pageSize,
      start:startPage
    }));

    // 중간 숫자
    for(let i = startPage; i <= endPage; i++) {
      renderT.appendChild(this.getComponent(component.mid, {
        nowPage:i,
        activePage:this.nowPage
      }));
    }

    // ▶
    renderT.appendChild(this.getComponent(component.last, {
      totalPage:totalPage,
      pageSize:pageSize,
      end:endPage
    }))
  }
}