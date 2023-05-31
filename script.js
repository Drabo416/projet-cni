(function(){
    const block = document.querySelectorAll('.content-block')
    const submitButton = document.querySelector('.button-submit')
    const reset = document.querySelector(".button-reset")
    let index  = 1
    const setpManager = (index)=>{
        if(index>block.length)return
        for(let element=0; element<block.length;element++){
            if(element==(index-1)){
                console.log(element)
                block[element].style.display="block"
            }else{
                block[element].style.display="none"
            }
        }
    }
    submitButton.addEventListener('click', (e)=>{
        submitButton.innerHTML=index<block.length-1?'Suvant':'Envoyer'
        reset.innerHTML=index ==0?'Annuler':'Précédent'
        if(index!=block.length){
            e.preventDefault()
        }else{
            return 
        }
        index++
        setpManager(index)
    })
    reset.addEventListener('click', (e)=>{
        submitButton.innerHTML=index<block.length-1?'Suvant':'Envoyer'
        reset.innerHTML=index ==0?'Annuler':'Précédent'
        if(index!=0){
            e.preventDefault()
        }else{
            return 
        }
        index--
        setpManager(index)
    })
    setpManager(index)

})()