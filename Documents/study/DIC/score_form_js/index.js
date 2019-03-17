var app = new Vue({
  el:"#app",
  data:{
    english:0,
    math:0,
    national_language:0,
    society:0,
    science:0,
    total:0,
    average:0,
    rank: "",
    judge:"",
    final:""
  },
  methods:{
    getRank:function(){
      const avg = this.getAverage
      let rank = ""
      if(avg >= 80){
        rank = "A"
      }else if(avg >= 60){
        rank = "B"
      }else if(avg >= 40){
        rank = "C"
      }else{
        rank = "D"
      }
      this.rank = rank
    },
    getJudge:function(){
      let result = ""
      const ans = this.getArray.filter(elm=>{
        return elm < 60 
      })
      if(ans.length>0){
        result = "不合格"
      }else{
        result = "合格"
      }
      this.judge =  result
    },
    getFinalJudge:function(){
      this.getRank()
      this.getJudge()
      this.final = `あなたの成績は${ this.rank }です。${this.judge }です。`
    }
  },
  computed:{
    getArray:function(){
      return arr = [
        Number(this.english),
        Number(this.math),
        Number(this.national_language),
        Number(this.society),
        Number(this.science)
      ]
    },
    getTotal:function(){
      return  this.getArray.reduce((acc,cur)=>{
        return acc + cur
      })
    },
    getAverage:function(){
      return this.getTotal / 5
    }
  },
})