const listEl = document.getElementsByClassName('main-items')[0];
let outList;

let getList = () => {
    fetch('/out/list')
    .catch(error => console.dir(error))
    .then(response => response.json())
    .then(data => {
        outList = data;
        drawList();
    })
}

let drawList = () => {
    let html, each, item;
    html = '';
    for(let x=0; x < outList.length; x++ ){
        item = outList[x];
        each = `<div>
                    <input type="hidden" class="items-idx" value="${item.gih_idx}">
                    <div>${x+1}</div>
                    <div>${item.gi_name}</div>
                    <div>${item.gcm_code}</div>
                    <div>${item.gih_price}원</div>
                    <div>${item.gih_qty}EA</div>
                    <div>총 ${item.total}원</div>
                    <div>${item.gih_regdate}</div>
                    <div class="btns-box">
                        <div class="items-btn-orange" data-idx="orange1"></div>
                        <div class="items-btn-green" data-idx="green1"></div>
                        <div class="items-btn-red" data-idx="red1"></div>
                    </div>
                </div>`;
        html += each;
        console.log(x);
    }
    listEl.innerHTML = html;
   
}