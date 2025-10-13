class PagingManager {
  constructor() {
    this.components = {};
    this._nowPage = 1;
  }

  get nowPage() {
    return this._nowPage;
  }

  set nowPage(nowPage) {
    this._nowPage = nowPage;
  }

  setComponent(name, html) {
    this.components[name] = html;
  }

  getComponent(name, data) {
    const component = this.components[name];
    if(!component) throw new Error(`등록된 컴포넌트가 없습니다: ${name}`);

    return component(data);
  }

  renderer(componentNames, pagingID, endPage, pageSize = 5) {
      if (!pagingID) throw new Error(`선택된 페이징 관련 태그의 ID가 존재하지 않습니다. 전달된 ID : ${pagingID}`);

      const paging = document.getElementById(pagingID);
      paging.innerHTML = '';

      const start = Math.floor((this._nowPage - 1) / pageSize) * pageSize + 1;
      const end = Math.min(start + pageSize - 1, endPage);

      // start (◀ 버튼)
      paging.appendChild(this.getComponent(componentNames.start, {
          totalPage: endPage,
          pageSize: pageSize,
          start: start
      }));

      // middle (페이지 번호)
      for (let i = start; i <= end; i++) {
          paging.appendChild(this.getComponent(componentNames.middle, {
              currentPage: i,
              activePage: this._nowPage // 활성화 상태를 위한 현재 인스턴스의 페이지 정보 전달
          }));
      }

      // end (▶ 버튼)
      paging.appendChild(this.getComponent(componentNames.end, {
          totalPage: endPage,
          pageSize: pageSize,
          end: end
      }));
  }

}