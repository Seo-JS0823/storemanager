function slideOpen(tagName) {
  let modal = modalIdValidation(tagName);
  modal.style.transform = 'translateX(0%)';
}

function slideCloseR(tagName) {
  let modal = modalIdValidation(tagName);
  modal.style.transform = 'translateX(100%)';
}

function slideCloseL(tagName) {
  let modal = modalIdValidation(tagName);
  modal.style.transform = 'translateX(-100%)';
}

function displayOpen(tagName, display) {
  let modal = modalIdValidation(tagName);
  console.log(modal)
  if(!display) throw new TypeError('모달을 열 Display 형식을 지정하세요.');

  if(modal instanceof HTMLElement) {
    modal.style.display = display;
  }
}

function displayClose(tagName) {
  let modal = modalIdValidation(tagName);
  modal.style.display = 'none';
}

function modalIdValidation(tagName) {
  if(tagName) {
    let modal = document.getElementById(tagName);

    if(!modal) throw new Error(`존재하지 않는 모달입니다. 모달의 ID를 확인하세요. 전달된 ID : ${tagName}`);

    return modal;
  }
}