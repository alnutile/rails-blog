var Scrambler = {
    unoutput: '', 
    scramoutput: '', 
    unscram: function(object) {
      $(object).each(function(){
        if($(this).attr('hidden') != undefined) {
          Scrambler.unoutput += $(this).text();
        }
      });
    },
    /**
     * http://stackoverflow.com/questions/10726909/random-alpha-numeric-string-in-javascript
    */
    randomNum: function(hi) {
      return Math.floor(Math.random()*hi);
    },

    randomChar: function() {
      return String.fromCharCode(Scrambler.randomNum(100));
    },

    randomString: function(loop) {
      var str = Scrambler.randomChar(Math.random().toString(36).slice(-1));
      if (loop == 101) {
        var br = "<br>";
      } else {
        var br = '';
      }
      return "<span>"+str+"</span>"+br;     
    },

    scram: function(text) {
      var codeArray = text.split("");
      var count = 0;
      for (index = 0; index < codeArray.length; ++index)  {
        
        for (count = 0; count < 101; ++count) {
          if(count <= 50) { 
            Scrambler.scramoutput += Scrambler.randomString(count);
          } else if (count >=52 && count <= 101) {
            Scrambler.scramoutput += Scrambler.randomString(count);
          }  else {
            Scrambler.scramoutput += "<span hidden>"+codeArray[index]+"</span>";
          }
        }     
      }
    }
}