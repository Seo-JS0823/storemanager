const outEl = document.getElementById('out-list');
const listEl = document.querySelector('.m-items');
let outList;

outEl.addEventListener('click', () => {
    getList();
})

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
    console.log(outList);
    for(let x = 0; x < outList.length; x++ ){
        item = outList[x];
        each = `<div>
                    <div>${x+1}</div>
                    <div>${item.gi_name}</div>
                    <div>${item.gcm_code}</div>
                    <div>${item.gih_price}원</div>
                    <div>${item.gih_qty}EA</div>
                    <div>총 ${item.total}원</div>
                    <div>${item.gih_regdate}</div>
                    <div class="btns-box"> 
                        <div class="items-btn orange"></div>
                        <div class="items-btn green"></div>
                        <div class="items-btn red"></div>
                    </div>
                    <div></div>
                </div>`;
        html += each;
        console.log(x);
    }
    if(listEl instanceof HTMLElement) {
        listEl.innerHTML = html;
    }
}






