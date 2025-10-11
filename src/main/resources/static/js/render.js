<<<<<<< HEAD
function call(url, parameter) {
  if(typeof parameter !== 'object') throw new TypeError(`전달한 파라미터 타입: ${typeof parameter}, Only object`);
  let text = url + '?'
  for(const [key, value] of Object.entries(parameter)) {
    text += key + '=' + value + '&'
  }
  return text.slice(0, -1);
}

function getValueByPath(obj, path) {
  return path.split('.').reduce((acc, key) => acc && acc[key], obj);
}

const Render = {
  components: {},

  setComponent(name, html) {
    this.components[name] = html;
  },

  getComponent(name, data) {
    const component = this.components[name];
    if(!component) throw new Error(`등록된 컴포넌트가 없습니다.`);
    
    return component(data);
  },

  callJSON(url, parameter, parent, callback, common) {
    fetch(call(url, parameter))
    .catch(error => console.log(error))
    .then(response => response.json())
    .then(json => {
      console.log(json)
      const parentTag = document.getElementById(parent);
      if(parentTag) parentTag.innerHTML = '';
      else throw new Error(`parentTag 의 ID 를 찾을 수 없습니다. 전달한 parent 값 : ${parent}`);

      let target = common ? getValueByPath(json, common) : json;

      if(Array.isArray(target)) {
        target.forEach(data => {
          const child = callback(data);
          if(child instanceof HTMLElement) parentTag.appendChild(child);
        });
      } else if(typeof target === 'object') {
        const child = callback(target);
        if(child instanceof HTMLElement) parentTag.appendChild(child);
      }
    })
  },
  callTEXT(url, parameter, parent, callback) {
    fetch(call(url, parameter))
    .catch(error => console.log(error))
    .then(response => response.text())
    .then(data => {
      const parentTag = document.getElementById(parent);
      const child = callback(data);

      if(parentTag) parentTag.appendChild(child);
    })
  }
=======
function call(url, parameter) {
  if(typeof parameter !== 'object') throw new TypeError(`전달한 파라미터 타입: ${typeof parameter}, Only object`);
  let text = url + '?'
  for(const [key, value] of Object.entries(parameter)) {
    text += key + '=' + value + '&'
  }
  return text.slice(0, -1);
}

function getValueByPath(obj, path) {
  return path.split('.').reduce((acc, key) => acc && acc[key], obj);
}

const Render = {
  components: {},

  setComponent(name, html) {
    this.components[name] = html;
  },

  getComponent(name, data) {
    const component = this.components[name];
    if(!component) throw new Error(`등록된 컴포넌트가 없습니다.`);
    
    return component(data);
  },

  callJSON(url, parameter, parent, callback, common) {
    fetch(call(url, parameter))
    .catch(error => console.log(error))
    .then(response => response.json())
    .then(json => {
      console.log(json)
      const parentTag = document.getElementById(parent);
      if(parentTag) parentTag.innerHTML = '';
      else throw new Error(`parentTag 의 ID 를 찾을 수 없습니다. 전달한 parent 값 : ${parent}`);

      let target = common ? getValueByPath(json, common) : json;

      if(Array.isArray(target)) {
        target.forEach(data => {
          const child = callback(data);
          if(child instanceof HTMLElement) parentTag.appendChild(child);
        });
      } else if(typeof target === 'object') {
        const child = callback(target);
        if(child instanceof HTMLElement) parentTag.appendChild(child);
      }
    })
  },
  callTEXT(url, parameter, parent, callback) {
    fetch(call(url, parameter))
    .catch(error => console.log(error))
    .then(response => response.text())
    .then(data => {
      const parentTag = document.getElementById(parent);
      const child = callback(data);

      if(parentTag) parentTag.appendChild(child);
    })
  }
>>>>>>> fe880323677131d19633a252e168557fc548128b
}