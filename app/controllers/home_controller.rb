class HomeController < ApplicationController
  # 충북대찌릿
  require 'unirest'

  
    def keyboard_init
        msg =
            {
              type: "buttons",
              buttons: ["전자공학부 홈페이지", 
              "종합정보시스템",
              "바압",
              "소자정보",
              "사용법",  
              "전자상식(공사중)",
              "읽을거리(랜덤)",   
              "충북대학교 어둠의게시판"]
            }
        render json: msg, status: :ok
    end
    
    def self.index #날씨
      # url = 'api.openweathermap.org/data/2.5/weather?id=1845604&appid=8354ba5e11c5b42f5cd7edd3b2f2f6c0'
      response = Unirest.get 'https://api.openweathermap.org/data/2.5/weather?id=1845604&appid=8354ba5e11c5b42f5cd7edd3b2f2f6c0&units=metric', 
                        headers:{ "Accept" => "application/json" }

                        
      # puts(response.code)
      # puts(response.body) # Parsed body
      @temperature = response.body['main']['temp']
      @supdo = response.body['main']['humidity']
      # puts(temperature)      
      return @temperature
    
    end
    
    def self.ygg1   ##양진재 아침
      time1=Time.now
      dayday = [time1.year, time1.month, time1.day] * '-'    # [2009, 1, 10] * '-' # => "2009-1-10"     
      # dayday=time1.year+'-'+time1.month+'-'+time1.day
      # bok_url = 'https://bablabs.com/openapi/v1/campuses/WNtKMDqIcl/stores?type&date=2018-04-18'
      response = Unirest.get 'https://bablabs.com/openapi/v1/campuses/WNtKMDqIcl/stores?type&date='+dayday,
                          headers:{"Accesstoken" => "6hpogihj4qV8NL8FEQrcJ79KeqauppoWcW6ZfYnbruxqdRvGOf"}
                          # parameters:{ :type => "", :date => dayday }
                          # puts(dayday)
                          
      # time1.to_a
      # time1.in_time_zone("Seoul")

      # if time1.hour < 10
      #   a=0                 #아침00시~ 10시까지 아침메뉴
      #   elsif time1.hour < 14
      #   a=1                   #난조빱이라 안되게따
      # else
      #   a=2
      # end
        
      # puts(response.body["stores"][0]["menus"][0]["description"])                          
      @meal1 = response.body["stores"][0]["menus"][0]["description"]
      # @meal = response.body["stores"]["menus"]["description"]
      # puts(response.body["stores"]["menus"].class)
      return @meal1
    end
    
    def self.ygg2 #양진재 점심
      time1=Time.now
      dayday = [time1.year, time1.month, time1.day] * '-'
      response = Unirest.get 'https://bablabs.com/openapi/v1/campuses/WNtKMDqIcl/stores?type&date='+dayday,
                          headers:{"Accesstoken" => "6hpogihj4qV8NL8FEQrcJ79KeqauppoWcW6ZfYnbruxqdRvGOf"}
      @meal2 = response.body["stores"][0]["menus"][1]["description"]
      return @meal2
    end
    
    def self.ygg3 #양진재 저녁
      time1=Time.now
      dayday = [time1.year, time1.month, time1.day] * '-'
      response = Unirest.get 'https://bablabs.com/openapi/v1/campuses/WNtKMDqIcl/stores?type&date='+dayday,
                          headers:{"Accesstoken" => "6hpogihj4qV8NL8FEQrcJ79KeqauppoWcW6ZfYnbruxqdRvGOf"}
      @meal3 = response.body["stores"][0]["menus"][2]["description"]
      return @meal3
    end    
    
    def self.ysg1  #양성재 아침
      time1=Time.now
      dayday = [time1.year, time1.month, time1.day] * '-'
      response = Unirest.get 'https://bablabs.com/openapi/v1/campuses/WNtKMDqIcl/stores?type&date='+dayday,
                          headers:{"Accesstoken" => "6hpogihj4qV8NL8FEQrcJ79KeqauppoWcW6ZfYnbruxqdRvGOf"}
      @meal4 = response.body["stores"][1]["menus"][0]["description"]
      return @meal4
    end
    
    def self.ysg2  #양성재 점심
      time1=Time.now
      dayday = [time1.year, time1.month, time1.day] * '-'
      response = Unirest.get 'https://bablabs.com/openapi/v1/campuses/WNtKMDqIcl/stores?type&date='+dayday,
                          headers:{"Accesstoken" => "6hpogihj4qV8NL8FEQrcJ79KeqauppoWcW6ZfYnbruxqdRvGOf"}
      @meal5 = response.body["stores"][1]["menus"][1]["description"]
      return @meal5
    end    
    
    def self.ysg3  #양성재 저녁
      time1=Time.now
      dayday = [time1.year, time1.month, time1.day] * '-'
      response = Unirest.get 'https://bablabs.com/openapi/v1/campuses/WNtKMDqIcl/stores?type&date='+dayday,
                          headers:{"Accesstoken" => "6hpogihj4qV8NL8FEQrcJ79KeqauppoWcW6ZfYnbruxqdRvGOf"}
      @meal6 = response.body["stores"][1]["menus"][2]["description"]
      return @meal6
    end    
    
    def self.gsg1 #개성재 아침
      time1=Time.now
      dayday = [time1.year, time1.month, time1.day] * '-'
      response = Unirest.get 'https://bablabs.com/openapi/v1/campuses/WNtKMDqIcl/stores?type&date='+dayday,
                          headers:{"Accesstoken" => "6hpogihj4qV8NL8FEQrcJ79KeqauppoWcW6ZfYnbruxqdRvGOf"}
      @gsg1 = response.body["stores"][2]["menus"][0]["description"]
      return @gsg1
    end    
    
    def self.gsg2  #개성재 점심
      time1=Time.now
      dayday = [time1.year, time1.month, time1.day] * '-'
      response = Unirest.get 'https://bablabs.com/openapi/v1/campuses/WNtKMDqIcl/stores?type&date='+dayday,
                          headers:{"Accesstoken" => "6hpogihj4qV8NL8FEQrcJ79KeqauppoWcW6ZfYnbruxqdRvGOf"}
      @gsg2 = response.body["stores"][2]["menus"][1]["description"]
      return @gsg2
    end    
    
    def self.gsg3  #개성재 저녁
      time1=Time.now
      dayday = [time1.year, time1.month, time1.day] * '-'
      response = Unirest.get 'https://bablabs.com/openapi/v1/campuses/WNtKMDqIcl/stores?type&date='+dayday,
                          headers:{"Accesstoken" => "6hpogihj4qV8NL8FEQrcJ79KeqauppoWcW6ZfYnbruxqdRvGOf"}
      @gsg3 = response.body["stores"][2]["menus"][2]["description"]
      return @gsg3
    end
    
    def self.sh1   #신학1층 주먹밥[8:30~10:50]
      time1=Time.now
      dayday = [time1.year, time1.month, time1.day] * '-'
      response = Unirest.get 'https://bablabs.com/openapi/v1/campuses/WNtKMDqIcl/stores?type&date='+dayday,
                          headers:{"Accesstoken" => "6hpogihj4qV8NL8FEQrcJ79KeqauppoWcW6ZfYnbruxqdRvGOf"}
      @meal21 = response.body["stores"][3]["menus"][0]["description"]
      return @meal21
    end    
    
    def self.sh2 #신학1층 백반
      time1=Time.now
      dayday = [time1.year, time1.month, time1.day] * '-'
      response = Unirest.get 'https://bablabs.com/openapi/v1/campuses/WNtKMDqIcl/stores?type&date='+dayday,
                          headers:{"Accesstoken" => "6hpogihj4qV8NL8FEQrcJ79KeqauppoWcW6ZfYnbruxqdRvGOf"}
      @meal22 = response.body["stores"][3]["menus"][1]["description"]
      return @meal22
    end    
    
    def self.sh3   #신학1층 백반특식
      time1=Time.now
      dayday = [time1.year, time1.month, time1.day] * '-'
      response = Unirest.get 'https://bablabs.com/openapi/v1/campuses/WNtKMDqIcl/stores?type&date='+dayday,
                          headers:{"Accesstoken" => "6hpogihj4qV8NL8FEQrcJ79KeqauppoWcW6ZfYnbruxqdRvGOf"}
      @meal23 = response.body["stores"][3]["menus"][2]["description"]
      return @meal23
    end    

    def self.sh4   #일품[11:00~14:30]
      time1=Time.now
      dayday = [time1.year, time1.month, time1.day] * '-'
      response = Unirest.get 'https://bablabs.com/openapi/v1/campuses/WNtKMDqIcl/stores?type&date='+dayday,
                          headers:{"Accesstoken" => "6hpogihj4qV8NL8FEQrcJ79KeqauppoWcW6ZfYnbruxqdRvGOf"}
      @meal24 = response.body["stores"][3]["menus"][3]["description"]
      return @meal24
    end    

    def self.sh5   #양식[11:00~14:30]
      time1=Time.now
      dayday = [time1.year, time1.month, time1.day] * '-'
      response = Unirest.get 'https://bablabs.com/openapi/v1/campuses/WNtKMDqIcl/stores?type&date='+dayday,
                          headers:{"Accesstoken" => "6hpogihj4qV8NL8FEQrcJ79KeqauppoWcW6ZfYnbruxqdRvGOf"}
      @meal25 = response.body["stores"][3]["menus"][4]["description"]
      return @meal25
    end    

    def self.sh6   #분식[11:00~14:30]
      time1=Time.now
      dayday = [time1.year, time1.month, time1.day] * '-'
      response = Unirest.get 'https://bablabs.com/openapi/v1/campuses/WNtKMDqIcl/stores?type&date='+dayday,
                          headers:{"Accesstoken" => "6hpogihj4qV8NL8FEQrcJ79KeqauppoWcW6ZfYnbruxqdRvGOf"}
      @meal26 = response.body["stores"][3]["menus"][5]["description"]
      return @meal26
    end    
    
    def self.sh7   #저녁
      time1=Time.now
      dayday = [time1.year, time1.month, time1.day] * '-'
      response = Unirest.get 'https://bablabs.com/openapi/v1/campuses/WNtKMDqIcl/stores?type&date='+dayday,
                          headers:{"Accesstoken" => "6hpogihj4qV8NL8FEQrcJ79KeqauppoWcW6ZfYnbruxqdRvGOf"}
      @meal27 = response.body["stores"][3]["menus"][6]["description"]
      return @meal27
    end        
    
    def self.sh8   #면코너[10:00~17:30]
      time1=Time.now
      dayday = [time1.year, time1.month, time1.day] * '-'
      response = Unirest.get 'https://bablabs.com/openapi/v1/campuses/WNtKMDqIcl/stores?type&date='+dayday,
                          headers:{"Accesstoken" => "6hpogihj4qV8NL8FEQrcJ79KeqauppoWcW6ZfYnbruxqdRvGOf"}
      @meal28 = response.body["stores"][3]["menus"][7]["description"]
      return @meal28
    end        
    
    def self.sh9   #간식코너
      time1=Time.now
      dayday = [time1.year, time1.month, time1.day] * '-'
      response = Unirest.get 'https://bablabs.com/openapi/v1/campuses/WNtKMDqIcl/stores?type&date='+dayday,
                          headers:{"Accesstoken" => "6hpogihj4qV8NL8FEQrcJ79KeqauppoWcW6ZfYnbruxqdRvGOf"}
      @meal29 = response.body["stores"][3]["menus"][8]["description"]
      return @meal29
    end    


    def self.bb1   #별빛레스토랑 신학2층
      time1=Time.now
      dayday = [time1.year, time1.month, time1.day] * '-'
      response = Unirest.get 'https://bablabs.com/openapi/v1/campuses/WNtKMDqIcl/stores?type&date='+dayday,
                          headers:{"Accesstoken" => "6hpogihj4qV8NL8FEQrcJ79KeqauppoWcW6ZfYnbruxqdRvGOf"}
      @bb11 = response.body["stores"][4]["menus"][0]["description"]
      return @bb11
    end   
    
    def self.uh1   #은하수식당 점심
      time1=Time.now
      dayday = [time1.year, time1.month, time1.day] * '-'
      response = Unirest.get 'https://bablabs.com/openapi/v1/campuses/WNtKMDqIcl/stores?type&date='+dayday,
                          headers:{"Accesstoken" => "6hpogihj4qV8NL8FEQrcJ79KeqauppoWcW6ZfYnbruxqdRvGOf"}
      @uh11 = response.body["stores"][5]["menus"][0]["description"]
      return @uh11
    end   
    
    def self.uh2   #은하수식당 저녁
      time1=Time.now
      dayday = [time1.year, time1.month, time1.day] * '-'
      response = Unirest.get 'https://bablabs.com/openapi/v1/campuses/WNtKMDqIcl/stores?type&date='+dayday,
                          headers:{"Accesstoken" => "6hpogihj4qV8NL8FEQrcJ79KeqauppoWcW6ZfYnbruxqdRvGOf"}
      @uh22 = response.body["stores"][5]["menus"][1]["description"]
      return @uh22
    end       
    
    
    def chat_control
      
        received_data = JSON.parse(request.raw_post)
        user_key = received_data["user_key"]
        type_name = received_data["type"]
        content = received_data["content"]
        
        # puts(user_key, type_name, content)
        
        main_menu = ["전자공학부 홈페이지",
        "종합정보시스템",
        "바압",
        "소자정보", 
        "사용법",
        "전자상식(공사중)",
        "읽을거리(랜덤)",
        "충북대학교 어둠의게시판"]
        
        food_menu =["■처음으로",
        "양진재",
        "양성재",
        "개성재",
        "한빛식당(신학1층)",
        "별빛레스토랑(신학2층)",
        "은하수식당(교직원식당)"
        ]
        
        food_when1 =["■처음으로",  #양진재 아점저
        "양진재 아침",
        "양진재 점심",
        "양진재 저녁"]

        food_when2 =["■처음으로",  #양성재 아점저
        "양성재 아침",
        "양성재 점심",     
        "양성재 저녁"]

        food_when3 =["■처음으로",  #개성재 아점저
        "개성재 아침",
        "개성재 점심",     
        "개성재 저녁"]
        
        food_when4 =["■처음으로",  #신학 메뉴
        "주먹밥[8:30~10:50]",
        "백반[11:00~14:00]",     
        "백반특식[11:00~14:00]",
        "일품[11:00~14:30]",
        "양식[11:00~14:30]",
        "분식[11:00~14:30]",
        "저녁[16:30~18:30]",
        "면코너[10:00~17:30]",
        "간식코너[10:00~17:30]"]      
        
        food_when5 =["■처음으로",  #신학 2층 별빛레스토랑
        "별빛레스토랑 점심[11:30~14:00]"]     
        
        food_when6 =["■처음으로", #은하수식당
        "은하수식당 점심[11:30~13:30]",
        "은하수식당 저녁[17:30~19:00]"]
        
        
        circuit_menu = ["■처음으로",
                "2114 / 1024 x 4 SRAM",
                "2716 / NMOS 128K 16K x 8 UV EPROM",
                "4001 / 4001B / Quad 2 Input NOR Buffered Gate",
                "4011 / Quad 2-Input NAND Buffered Series",
                "4050 / 4050B / Hex Non-Inverting Buffer",
                "4520 / 4520B / Dual 4-Bit Binary Counter",
                "7400 / 74LS00 / Quad 2-Input NAND Gate",
                "7402 / 74LS02 / Quad 2-Input Nor Gate", 
                "7403 / 74LS03 / Quad 2-Input Nand Gate", 
                "7404 / 74LS04 / Hex Inverter",
                "7405 / 74LS05 / Hex Inverter",
                "7406 / 74LS06 / Hex Inverted Buffers with OC Outputs",
                "7408 / 74LS08 / Quad 2-Input AND Gate",
                "7410 / 74LS10 / Triple 3-Input NAND Gate",
                "7411 / 74LS11 / Triple 3 Input AND Gate",
                "7420 / 74LS20 / Dual 4-Input NAND Gate",
                "7421 / 74LS21 / Dual 4-Input Positive AND Gate",
                "7432 / 74LS32 / Quad 2-Input OR Gate",
                "7442 / 74LS42 / BCD to Decimal Decoder",
                "7447 / 74LS47 / BCD to 7-segment Decoders/Drivers",
                "7472 / 74LS72 / AND-gated JK FF with Preset and Clear",
                "7474 / 74LS02 / D Flip-Flop",
                "7476 / 74LS76 / Dual Master Slave J-K F-F",
                "7486 / 74LS86 / Quad 2-Input Exclusive-OR Gate",
                "7489 / 74LS89 / 64 Bit RAM",
                "7490 / 74LS90 / Decade and Binary Counters",
                "7493 / 74LS93 / Decade and Binary Counters",
                "74121 / 74LS121 / One-Shot with Clear and Complementary Outputs",
                "74138 / 74LS138 / Decoder / Demultiplexer",
                "74151 / 74LS151 / Data Selectors / Multiplexers",
                "74153 / 74LS153 / Data 4-Line to 1-Line Data Selectors / Mux",
                "74164 / 74LS164 / 8 BIT SIPO SHIFT REGISTER",
                "74169 / 74LS169 / 4-Bit Up / Down Binary Counter",
                "74390 / 74LS390 / Dual 4-Bit Decade Counter",
                "1N4001 / Diode",#여기부터
                "1N4002 / Diode",
                "2N2222 / Transister",
                "CA3046 / Transister",
                "CD4007 / Transister",
                "MC14007UB / Dual Complementary Pair Plus Inverter",#여기까지 추가
                "FND507 / 7segment",
                "LM555 / timer",
                "LM741 / Single Operational Amplifer",
                "8p Dip Switch",
                "라즈베리파이",
                "아두이노",
                "검색(AllDataSheet)"]
                
        use_menu = ["■처음으로",
                  "저항 읽는법",
                  "커패시터 읽는법",
                  "인덕터 읽는법",
                  "브래드보드 사용법",
                  "가변저항 사용법",
                  "함수발생기 사용법",
                  "오실로스코프 사용법",
                  "아날로그 멀티미터(테스터기) 사용법",
                  "디지털 멀티미터 사용법",
                  "전원공급기 사용법",
                  "납땜하는 방법",
                  "피스파이스 사용법",
                  "MATLAB 사용법"]
                  
        formula_menu = ["■처음으로", 
        "단위",
        "각종상수들",   #"빛의 속도",입실론0...,전하의질량
        "주기율표",
        "미적분공식",
        "삼각함수공식", #고딩수학공식들묶어서 등비수열, 근의공식
        "라플라스 변환",
        "푸리에 급수/변환",
        "등비수열 공식",
        "근의 공식",
        "오일러 공식", 
        "Y-Δ 변환",
        "R,L,C관계식",
        "페이저",
        "데시벨",
        "콘볼루션",
        "반도체전류공식",
        "플립플롭 진리표",
        "가우스의법칙",
        "맥스웰 방정식",
        "왼손,오른손법칙",
        "계속 추가할 예정(처음으로)"
        ]
        
        random_reply = ["충북대학교의 표어는 개신(開新, NOVA APERIO), 건학이념은 진리, 정의, 개척.",
        
        "거점국립대 중에서 제주대 다음으로 학생 수가 적다. 다른 거점국립대의 학생수가 2만명 초반~3만명 근접인데에 비하여 심하게 적은 학생수이다. 기본적으로 충북 인구가 적은데다가 전통적으로 청주는 청주대, 서원대, 교원대 등 규모있는 4년제 대학이 많은 것이 이유로 보인다.",
        
        "1951년 도립 청주초급농과대학으로 개교하여, 1963년 국립 충북대학으로 개편되었다.",
        
        "2012년까지만해도 기숙사에 점호가 있었다. 월~목 밤 12시 통금으로, 이 시간이 되면 층장이 인원점검을 하는 식이었다. 그러다 2013년부터 점호를 없애고 통금시간도 새벽 1시로 변경되었다.",
        
        "서울대학교를 제외한 국립대학 총장은 공무원으로서 장관에 준하는 대우를 받는다.",
        
        "2018년 4월 12일 직선제로 치러진 차기 충북대 총장 선거에서 법학전문대학원 김수갑(56) 교수가 임용후보자로 당선됐다.",
        
        "2012년 2학기부터 N14(구 56동)에서 강의하는 교양과목에 전자출결이 도입되었다. 강의실 앞에서 학생증을 찍고 교수가 인원수를 확인하는 식이다. 전자출결 도입으로 대리출석이 어려워 질 듯 싶다. 출결기가 고장나는 일도 종종 있어서 교수도 학생도 귀찮기만 하다. 현재는 사용되지 않는 듯 하다.",
        
        "기존 학칙에는 재수강 상한선제와 학점포기제도가 없었고 전공과목은 절대평가로 하였으나, 2011년에 전공과목을 상대평가로 전환하고 2012학년도 부터 재수강 상한선제와 학점포기제도가 도입되었다. 이에 따라 C+이하인 과목부터 재수강이 가능하게 되었으며 재수강시 최고로 받을 수 있는 학점은 B+이다. 또한 7학기(4학년 1학기)때 최대 3학점 과목 1개에 한하여 학점포기가 가능였다. 하지만 2014년 9월 1일자로 학점포기제도가 사라졌다. 추가적으로 2011년 겨울방학에 전공과목의 신청은 해당 학년 학생들의 수강신청 기간에 우선적으로 받는 규범이 시행되기도 하였다. 2017년부터 재수강시 최고로 받을 수 있는 학점이 A0로 상향되었다.",
        
        "국립대 특성상 건물들과 시설들이 노후된 편이다. 타 대학교는 기존 건물도 리모델링이나 증축을 많이 하는 편이나 충북대는 그런거 없다. 에어컨이나 빔프로젝터가 없는 강의실이 은근 많으며 이런 시설이 구비되어있어도 기계가 노후된 강의실이 대다수다. 이것 외에도 책걸상이 망가져 방치되어있는 강의실도 있고 일반 초, 중, 고교 교실 만도 못한 강의실이 대다수다. 동아리에 대한 투자는 전무하다고 봐도 무방한 상황. 학생들이나 교수들 사이에서는 시설개선을 촉구하고 있으나 학교는 예산이 부족하다는 이유로 모르쇠 일관하고 있다. 그런데도 불구하고 영재교육용 강의실 등 외부에만 알려져 있지 학생과는 아무 상관 없는 용도로 쓰이는 시설은 차등적으로 먼저 리모델링 하는 모습을 보여줘서 까인다.",
        
        "2016년에 비사범대 학사과정을 대상으로 하는 교직과정이 D등급 평가를 받아, 선발인원을 50% 감축하게 되었다."
        ].sample
        
        
        
        
        
        if content == "전자공학부 홈페이지"
            # puts('start')
            # response = Unirest.get 'https://api.openweathermap.org/data/2.5/weather?id=1845604&appid=8354ba5e11c5b42f5cd7edd3b2f2f6c0&units=metric', 
            #             headers:{ "Accept" => "application/json" }
            # puts('second')
            # # puts(response.code)
            # # puts(response.body) # Parsed body
            # temperature = response.body['main']['temp']
            # puts('third')
            # puts(temperature)
            # puts(temperature.class)
            # print(temperature + 'fdsfds')
            # @supdo = response.body['main']['humidity']
            
            msg = {
              message: {
                    # "text": temperature.to_s(),
                    # "text": HomeController.index().to_s(),
                    # "text": HomeController.ygg1().to_s(),
                     "message_button": {
                        "label": "전자공학부",
                        "url": "http://elec.chungbuk.ac.kr/index.php"
                    }
              },
               
              keyboard: {
                type: "buttons",
                buttons: main_menu
              }
            }
            render json: msg, status: :ok
            
            
            
            
            
        elsif content == "종합정보시스템"
            msg = {
              message: {
                     "message_button": {
                      "label": "종합정보시스템",
                      "url": "http://gaesin.chungbuk.ac.kr/login.html"
                    }
              },
              
              keyboard: {
                type: "buttons",
                buttons: main_menu
              }
            }
            render json: msg, status: :ok
            
        elsif content == "바압"
            msg = {
              message: {
                "text":"항목을 선택해주세요."
              },
              
              keyboard: {
                type: "buttons",
                buttons: food_menu
              }
            }
            render json: msg, status: :ok
            
            
                              elsif content == "양진재"
                                  msg = {
                                    message: {
                                      "text":"평일아침 7:20~9:00\n평일점심 11:30~13:30\n평일저녁 17:30~19:10\n주말아침 08:00~09:00\n주말점심 12:00~13:00\n주말저녁 17:30~19:00"
                                    },
                                    
                                    keyboard: {
                                      type: "buttons",
                                      buttons: food_when1
                                    }
                                  }
                                  render json: msg, status: :ok                          
            
                                                    elsif content == "양진재 아침"
                                                        msg = {
                                                          message: {
                                                            "text": HomeController.ygg1().to_s()
                                                          },
                                                          
                                                          keyboard: {
                                                            type: "buttons",
                                                            buttons: food_when1
                                                          }
                                                        }
                                                        render json: msg, status: :ok            
            
                                                    elsif content == "양진재 점심"
                                                        msg = {
                                                          message: {
                                                            "text": HomeController.ygg2().to_s()
                                                          },
                                                          
                                                          keyboard: {
                                                            type: "buttons",
                                                            buttons: food_when1
                                                          }
                                                        }
                                                        render json: msg, status: :ok
                                                        
                                                    elsif content == "양진재 저녁"
                                                        msg = {
                                                          message: {
                                                            "text": HomeController.ygg3().to_s()
                                                          },
                                                          
                                                          keyboard: {
                                                            type: "buttons",
                                                            buttons: food_when1
                                                          }
                                                        }
                                                        render json: msg, status: :ok


                              elsif content == "양성재"
                                  msg = {
                                    message: {
                                      "text":"평일아침 7:20~9:00\n평일점심 11:30~13:30\n평일저녁 17:30~19:10\n주말아침 08:00~09:00\n주말점심 12:00~13:00\n주말저녁 17:30~19:00"
                                    },
                                    
                                    keyboard: {
                                      type: "buttons",
                                      buttons: food_when2
                                    }
                                  }
                                  render json: msg, status: :ok                          
            
                                                    elsif content == "양성재 아침"
                                                        msg = {
                                                          message: {
                                                            "text": HomeController.ysg1().to_s()
                                                          },
                                                          
                                                          keyboard: {
                                                            type: "buttons",
                                                            buttons: food_when2
                                                          }
                                                        }
                                                        render json: msg, status: :ok            
            
                                                    elsif content == "양성재 점심"
                                                        msg = {
                                                          message: {
                                                            "text": HomeController.ysg2().to_s()
                                                          },
                                                          
                                                          keyboard: {
                                                            type: "buttons",
                                                            buttons: food_when2
                                                          }
                                                        }
                                                        render json: msg, status: :ok
                                                        
                                                    elsif content == "양성재 저녁"
                                                        msg = {
                                                          message: {
                                                            "text": HomeController.ysg3().to_s()
                                                          },
                                                          
                                                          keyboard: {
                                                            type: "buttons",
                                                            buttons: food_when2
                                                          }
                                                        }
                                                        render json: msg, status: :ok


                              elsif content == "개성재"
                                  msg = {
                                    message: {
                                      "text":"평일아침 7:20~9:00\n평일점심 11:30~13:30\n평일저녁 17:30~19:10\n주말아침 08:00~09:00\n주말점심 12:00~13:00\n주말저녁 17:30~19:00"
                                    },
                                    
                                    keyboard: {
                                      type: "buttons",
                                      buttons: food_when3
                                    }
                                  }
                                  render json: msg, status: :ok                          
            
                                                    elsif content == "개성재 아침"
                                                        msg = {
                                                          message: {
                                                            "text": HomeController.gsg1().to_s()
                                                          },
                                                          
                                                          keyboard: {
                                                            type: "buttons",
                                                            buttons: food_when3
                                                          }
                                                        }
                                                        render json: msg, status: :ok            
            
                                                    elsif content == "개성재 점심"
                                                        msg = {
                                                          message: {
                                                            "text": HomeController.gsg2().to_s()
                                                          },
                                                          
                                                          keyboard: {
                                                            type: "buttons",
                                                            buttons: food_when3
                                                          }
                                                        }
                                                        render json: msg, status: :ok
                                                        
                                                    elsif content == "개성재 저녁"
                                                        msg = {
                                                          message: {
                                                            "text": HomeController.gsg3().to_s()
                                                          },
                                                          
                                                          keyboard: {
                                                            type: "buttons",
                                                            buttons: food_when3
                                                          }
                                                        }
                                                        render json: msg, status: :ok

                              elsif content == "한빛식당(신학1층)"
                                  msg = {
                                    message: {
                                      "text":"메뉴를 골라주세요"
                                    },
                                    
                                    keyboard: {
                                      type: "buttons",
                                      buttons: food_when4
                                    }
                                  }
                                  render json: msg, status: :ok                          
            
                                                    elsif content == "주먹밥[8:30~10:50]"
                                                        msg = {
                                                          message: {
                                                            "text": HomeController.sh1().to_s()
                                                          },
                                                          
                                                          keyboard: {
                                                            type: "buttons",
                                                            buttons: food_when4
                                                          }
                                                        }
                                                        render json: msg, status: :ok            
            
                                                    elsif content == "백반[11:00~14:00]"
                                                        msg = {
                                                          message: {
                                                            "text": HomeController.sh2().to_s()
                                                          },
                                                          
                                                          keyboard: {
                                                            type: "buttons",
                                                            buttons: food_when4
                                                          }
                                                        }
                                                        render json: msg, status: :ok
                                                        
                                                    elsif content == "백반특식[11:00~14:00]"
                                                        msg = {
                                                          message: {
                                                            "text": HomeController.sh3().to_s()
                                                          },
                                                          
                                                          keyboard: {
                                                            type: "buttons",
                                                            buttons: food_when4
                                                          }
                                                        }
                                                        render json: msg, status: :ok

                                                    elsif content == "일품[11:00~14:30]"
                                                        msg = {
                                                          message: {
                                                            "text": HomeController.sh4().to_s()
                                                          },
                                                          
                                                          keyboard: {
                                                            type: "buttons",
                                                            buttons: food_when4
                                                          }
                                                        }
                                                        render json: msg, status: :ok

                                                    elsif content == "양식[11:00~14:30]"
                                                        msg = {
                                                          message: {
                                                            "text": HomeController.sh5().to_s()
                                                          },
                                                          
                                                          keyboard: {
                                                            type: "buttons",
                                                            buttons: food_when4
                                                          }
                                                        }
                                                        render json: msg, status: :ok
                                                        
                                                    elsif content == "분식[11:00~14:30]"
                                                        msg = {
                                                          message: {
                                                            "text": HomeController.sh6().to_s()
                                                          },
                                                          
                                                          keyboard: {
                                                            type: "buttons",
                                                            buttons: food_when4
                                                          }
                                                        }
                                                        render json: msg, status: :ok
                                                        
                                                    elsif content == "저녁[16:30~18:30]"
                                                        msg = {
                                                          message: {
                                                            "text": HomeController.sh7().to_s()
                                                          },
                                                          
                                                          keyboard: {
                                                            type: "buttons",
                                                            buttons: food_when4
                                                          }
                                                        }
                                                        render json: msg, status: :ok                                                        
                                                        
                                                     elsif content == "면코너[10:00~17:30]"
                                                        msg = {
                                                          message: {
                                                            "text": HomeController.sh8().to_s()
                                                          },
                                                          
                                                          keyboard: {
                                                            type: "buttons",
                                                            buttons: food_when4
                                                          }
                                                        }
                                                        render json: msg, status: :ok                                                       

                                                     elsif content == "간식코너[10:00~17:30]"
                                                        msg = {
                                                          message: {
                                                            "text": HomeController.sh9().to_s()
                                                          },
                                                          
                                                          keyboard: {
                                                            type: "buttons",
                                                            buttons: food_when4
                                                          }
                                                        }
                                                        render json: msg, status: :ok

                              elsif content == "별빛레스토랑(신학2층)"
                                  msg = {
                                    message: {
                                      "text":"메뉴를 골라주세요"
                                    },
                                    
                                    keyboard: {
                                      type: "buttons",
                                      buttons: food_when5
                                    }
                                  }
                                  render json: msg, status: :ok 
                                  
                                                     elsif content == "별빛레스토랑 점심[11:30~14:00]"
                                                        msg = {
                                                          message: {
                                                            "text": HomeController.bb1().to_s()
                                                          },
                                                          
                                                          keyboard: {
                                                            type: "buttons",
                                                            buttons: food_when5
                                                          }
                                                        }
                                                        render json: msg, status: :ok

                              elsif content == "은하수식당(교직원식당)"
                                  msg = {
                                    message: {
                                      "text":"메뉴를 골라주세요"
                                    },
                                    
                                    keyboard: {
                                      type: "buttons",
                                      buttons: food_when6
                                    }
                                  }
                                  render json: msg, status: :ok 
                                  
                                                     elsif content == "은하수식당 점심[11:30~13:30]"
                                                        msg = {
                                                          message: {
                                                            "text": HomeController.uh1().to_s()
                                                          },
                                                          
                                                          keyboard: {
                                                            type: "buttons",
                                                            buttons: food_when6
                                                          }
                                                        }
                                                        render json: msg, status: :ok

                                                     elsif content == "은하수식당 저녁[17:30~19:00]"
                                                        msg = {
                                                          message: {
                                                            "text": HomeController.uh2().to_s()
                                                          },
                                                          
                                                          keyboard: {
                                                            type: "buttons",
                                                            buttons: food_when6
                                                          }
                                                        }
                                                        render json: msg, status: :ok
                                                        
        elsif content == "소자정보"
            msg = {
              message: {
                text: "소자를 선택해주세요."
              },
              
              keyboard: {
                type: "buttons",
                buttons:  circuit_menu
              }
            }
            render json: msg, status: :ok            
            
            
            
            
            
                                    elsif content == "■처음으로"           #공통적으로 쓰는 ■처음으로
                                        msg = {
                                          message: {
                                            text: "원하는 항목을 선택해주세요."
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: main_menu
                                          }
                                        }
                                        render json: msg, status: :ok             
            
            
                                    elsif content == "2114 / 1024 x 4 SRAM"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile5.uf.tistory.com/image/99A596505AD378590FC836",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/43?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                   
            
            
                                    elsif content == "2716 / NMOS 128K 16K x 8 UV EPROM"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile22.uf.tistory.com/image/99E9EE455AD378A5091C1F",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/44?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   
                                        
                                    elsif content == "4001 / 4001B / Quad 2 Input NOR Buffered Gate"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile28.uf.tistory.com/image/9959704E5AD378E20996BA",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/45?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                           
                                        
                                    elsif content == "4011 / Quad 2-Input NAND Buffered Series"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile21.uf.tistory.com/image/9970594B5AD37932285D3A",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/46?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                           
                                        
                                    elsif content == "4050 / 4050B / Hex Non-Inverting Buffer"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile5.uf.tistory.com/image/99D55B445AD3795727766C",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/47?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                           
                                        
                                    elsif content == "4520 / 4520B / Dual 4-Bit Binary Counter"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile26.uf.tistory.com/image/9957384D5AD379990A25DB",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/48?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                           
                                        
                                    elsif content == "7400 / 74LS00 / Quad 2-Input NAND Gate"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile29.uf.tistory.com/image/997C684C5AD35E810E9408",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/11?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                           

                                    elsif content == "7402 / 74LS02 / Quad 2-Input Nor Gate"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile25.uf.tistory.com/image/9945034A5AD35F6F1A12CB",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/12?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   


                                    elsif content == "7403 / 74LS03 / Quad 2-Input Nand Gate"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile6.uf.tistory.com/image/997FD54A5AD36FEE38883F",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/13?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   

                                    elsif content == "7404 / 74LS04 / Hex Inverter"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile30.uf.tistory.com/image/9925A74D5AD37036109DB8",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/14?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   

                                    elsif content == "7405 / 74LS05 / Hex Inverter"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile25.uf.tistory.com/image/99D9B3495AD3706C32151C",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/15?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   
                                    elsif content == "7406 / 74LS06 / Hex Inverted Buffers with OC Outputs"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile27.uf.tistory.com/image/9959663F5AD370910AD8F4",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/16?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   


                                    elsif content == "7408 / 74LS08 / Quad 2-Input AND Gate"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile24.uf.tistory.com/image/9920B93C5AD370BC1B9B8B",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/17?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   

                                    elsif content == "7410 / 74LS10 / Triple 3-Input NAND Gate"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile3.uf.tistory.com/image/99D20A335AD3710606EB75",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/18?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   

                                    elsif content == "7411 / 74LS11 / Triple 3 Input AND Gate"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile29.uf.tistory.com/image/997493335AD371320D83D8",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/19?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   

                                    elsif content == "7420 / 74LS20 / Dual 4-Input NAND Gate"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile8.uf.tistory.com/image/9979A93D5AD371630C1294",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/20?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   

                                    elsif content == "7421 / 74LS21 / Dual 4-Input Positive AND Gate"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile28.uf.tistory.com/image/99A82B3C5AD3719029FE69",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/21?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   
                                    elsif content == "7432 / 74LS32 / Quad 2-Input OR Gate"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile8.uf.tistory.com/image/99038A395AD371BA275CA0",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/22?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   
                                    elsif content == "7442 / 74LS42 / BCD to Decimal Decoder"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile28.uf.tistory.com/image/9982A2355AD371EA0B8868",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/23?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   

                                    elsif content == "7447 / 74LS47 / BCD to 7-segment Decoders/Drivers"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile4.uf.tistory.com/image/995BB63A5AD37216366455",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/24?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   


                                    elsif content == "7472 / 74LS72 / AND-gated JK FF with Preset and Clear"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile5.uf.tistory.com/image/99453B375AD37253200912",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/25?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   

                                    elsif content == "7474 / 74LS02 / D Flip-Flop"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile23.uf.tistory.com/image/993AE3405AD372A10C3B63",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/26?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok   

                                    elsif content == "7476 / 74LS76 / Dual Master Slave J-K F-F"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile27.uf.tistory.com/image/99E0A7335AD372CF1D5418",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/27?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok 


                                    elsif content == "7486 / 74LS86 / Quad 2-Input Exclusive-OR Gate"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile22.uf.tistory.com/image/992F52395AD372F302F1FF",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/28?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok 


                                    elsif content == "7489 / 74LS89 / 64 Bit RAM"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile7.uf.tistory.com/image/9929C43E5AD3731B34E87E",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/29?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok 

                                    elsif content == "7490 / 74LS90 / Decade and Binary Counters"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile1.uf.tistory.com/image/997284335AD37344035160",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/30?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok 

                                    elsif content == "7493 / 74LS93 / Decade and Binary Counters"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile29.uf.tistory.com/image/99BBF33B5AD3736A128D87",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/31?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok 

                                    elsif content == "74121 / 74LS121 / One-Shot with Clear and Complementary Outputs"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile5.uf.tistory.com/image/9957673A5AD37392209F78",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/32?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok 

                                    elsif content == "74138 / 74LS138 / Decoder / Demultiplexer"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile5.uf.tistory.com/image/99425E3B5AD373B733B963",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/33?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok 

                                    elsif content == "74151 / 74LS151 / Data Selectors / Multiplexers"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile4.uf.tistory.com/image/99DFA6335AD373E639E897",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/34?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok 

                                    elsif content == "74153 / 74LS153 / Data 4-Line to 1-Line Data Selectors / Mux"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile9.uf.tistory.com/image/99D0C23D5AD374130EE840",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/35?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok 
                                        
                                        
                                    elsif content == "74164 / 74LS164 / 8 BIT SIPO SHIFT REGISTER"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile26.uf.tistory.com/image/990720405AD3743C291313",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/36?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                         
                                        
                                    elsif content == "74169 / 74LS169 / 4-Bit Up / Down Binary Counter"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile21.uf.tistory.com/image/99C6B93A5AD3746E0BE1E8",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/37?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                         
                                        
                                    elsif content == "74390 / 74LS390 / Dual 4-Bit Decade Counter"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile10.uf.tistory.com/image/9943F3385AD374A028336F",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/38?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok  
                                        
                                    elsif content == "1N4001 / Diode"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile27.uf.tistory.com/image/99B25E4E5AD5F7271E02D7",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/69?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                        
                                        
                                    elsif content == "1N4002 / Diode"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile27.uf.tistory.com/image/99D3B6435AD5F74618B489",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/70?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                        
                                        
                                    elsif content == "2N2222 / Transister"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile25.uf.tistory.com/image/99122E445AD5F79D05E141",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/72?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok
                                        
                                    elsif content == "CA3046 / Transister"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile6.uf.tistory.com/image/99179E445AD5F7BA37DD0B",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/73?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                        
                                        
                                    elsif content == "CD4007 / Transister"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile28.uf.tistory.com/image/99E9A44C5AD5F7D525F3B2",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/74?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok
                                        
                                    elsif content == "MC14007UB / Dual Complementary Pair Plus Inverter"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile1.uf.tistory.com/image/9944734B5AD5F7F228D4DA",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/75?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok
                                      
                                        

                                    elsif content == "FND507 / 7segment"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile27.uf.tistory.com/image/99FC68385AD374D009FFBE",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/39?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok  
                                        
                                    elsif content == "LM555 / timer"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile29.uf.tistory.com/image/99C4A3335AD375102884E9",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/40?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok  
                                        
                                    elsif content == "LM741 / Single Operational Amplifer"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile29.uf.tistory.com/image/99673B3A5AD3754D07A3D6",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/41?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                          
                                        
                                    elsif content == "8p Dip Switch"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile23.uf.tistory.com/image/9977F8405AD3757D262AD9",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/42?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                          
                                        
                                    elsif content == "라즈베리파이"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile23.uf.tistory.com/image/99C3F5505AD4F97B222553",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/66?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                          
                                        
                                     elsif content == "아두이노"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile21.uf.tistory.com/image/9945E34C5AD4FB0F22C434",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/67?category=998763"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                         
                                        
                                    elsif content == "검색(AllDataSheet)"
                                        msg = {
                                          message: {
                                            message_button: {
                                              "label": "AllDataSheet 이동",
                                              "url": "http://www.alldatasheet.co.kr"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: circuit_menu
                                          }
                                        }
                                        render json: msg, status: :ok  
                                                                            
                                        

                                        
        elsif content == "사용법"
            msg = {
              message: {
                text: "원하는 사용법을 선택해주세요."
              },
              
              keyboard: {
                type: "buttons",
                buttons: use_menu
              }
            }
            render json: msg, status: :ok              
            
            
                                    elsif content == "저항 읽는법"
                                        msg = {
                                          message: {
                                            "text":"1Ω 갈흑금금 3.3Ω 주주금금\n10Ω 갈흑흑금 330Ω 주주갈금\n470Ω 황보갈금 560Ω 녹청갈금
                                            \n1KΩ 갈흑적금 1.8KΩ 갈회적금\n2KΩ 적흑적금 2.2KΩ 적적적금\n3.3KΩ 주주적금 4.7KΩ 황보적금
                                            \n5.6KΩ 녹청적금 6.8KΩ 청회적금\n10KΩ 갈흑주금 15KΩ 갈녹주금\n20KΩ 적흑주금 33KΩ 주주주금
                                            \n47KΩ 황보주금 51KΩ 녹갈주금\n140KΩ 갈황황금 390KΩ 주백황금",
                                            "photo": {
                                              "url": "http://cfile25.uf.tistory.com/image/995D30425AD4EB8911F13A",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/60?category=998769"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: use_menu
                                          }
                                        }
                                        render json: msg, status: :ok          
            

                                    elsif content == "커패시터 읽는법"
                                        msg = {
                                          message: {
                                            text:"0.01[uF] = 103\n0.047[uF] = 473\n0.47[uF] = 474\n3.5[uF] = 355\n4.7[uF] = 475",
                                            "photo": {
                                              "url": "http://cfile26.uf.tistory.com/image/995A59395AD4F06D187797",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/62?category=998769"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: use_menu
                                          }
                                        }
                                        render json: msg, status: :ok  

                                    elsif content == "인덕터 읽는법"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile1.uf.tistory.com/image/9970A33B5AD4EE5E16CAE8",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/61?category=998769"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: use_menu
                                          }
                                        }
                                        render json: msg, status: :ok  


                                    elsif content == "브래드보드 사용법"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile30.uf.tistory.com/image/99F6744F5AD4F28C168D8A",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/63?category=998769"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: use_menu
                                          }
                                        }
                                        render json: msg, status: :ok  

                                    elsif content == "가변저항 사용법"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile26.uf.tistory.com/image/996EA8475AD4F4741F956A",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/64?category=998769"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: use_menu
                                          }
                                        }
                                        render json: msg, status: :ok  

                                    elsif content == "함수발생기 사용법"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile5.uf.tistory.com/image/99142B345ADD2DAE058743",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/119?category=998769"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: use_menu
                                          }
                                        }
                                        render json: msg, status: :ok  
                                        
                                    elsif content == "오실로스코프 사용법"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "https://dthumb-phinf.pstatic.net/?src=%22http%3A%2F%2Fphyslab.snu.ac.kr%2Fnewphyslab%2Flab%2Fimage%2Foscillo%2Foscil01.jpg%22&type=w620",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/113?category=998769"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: use_menu
                                          }
                                        }
                                        render json: msg, status: :ok  

                                    elsif content == "아날로그 멀티미터(테스터기) 사용법"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://img1.daumcdn.net/thumb/R1920x0/?fname=http%3A%2F%2Fcfile30.uf.tistory.com%2Fimage%2F244B844A5910EB97156FC2",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/114?category=998769"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: use_menu
                                          }
                                        }
                                        render json: msg, status: :ok  


                                    elsif content == "디지털 멀티미터 사용법"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile29.uf.tistory.com/image/9923834B5ADD2F263187FD",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/115?category=998769"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: use_menu
                                          }
                                        }
                                        render json: msg, status: :ok              

                                    elsif content == "전원공급기 사용법"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "https://postfiles.pstatic.net/MjAxNzA5MTJfMjQg/MDAxNTA1MTQyMTEzMjc5.sFUrcTZTnwATM1HYpLCu-tQxorV3m58SnEGHh_JC_2Ag.QN1Uc_xc6dQ6Ebm4xLo45Q7TIikWZhvhiQjZ0C9SrNEg.JPEG.cj3024/DC_Power_supply_cv%EC%83%81%ED%83%9C.jpg?type=w773",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/116?category=998769"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: use_menu
                                          }
                                        }
                                        render json: msg, status: :ok  

                                    elsif content == "납땜하는 방법"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://kocoafab.cc//data/201508241452302866.jpg",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/117?category=998769"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: use_menu
                                          }
                                        }
                                        render json: msg, status: :ok
                                        
                                    elsif content == "피스파이스 사용법"
                                        msg = {
                                          message: {
                                            text: "피스파이스(Capture CIS) 실행 -> File-New Project -> Name 임의로설정 ->\
                                            Analog or Mixed A/D 선택 -> OK -> Create a blank project -> OK ->\
                                            화면나온상태에서 P누르면 -> Add Library -> PSpice폴더내의 라이브러리 모두선택후 열기
                                            \n
                                            *MOSFET(CA3046)\nPart에 검색 Q2N2222(아무BJT) -> OK -> 우클릭 - Edit PSpice Model ->\
                                            주어진 모델변수로 변경(ca3046)\n모델변수는 '자세히보기' 클릭",

                                            
                                            "photo": {
                                              "url": "http://cfile23.uf.tistory.com/image/991112445AD6051D2292B9",
                                              "width": 420,
                                              "height": 330
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/77?category=998769"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: use_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                        
                                    elsif content == "MATLAB 사용법"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile29.uf.tistory.com/image/990FEC505ADD2FB6101723",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/118?category=998769"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: use_menu
                                          }
                                        }
                                        render json: msg, status: :ok


                                        
        elsif content == "전자상식(공사중)"
            msg = {
              message: {
                text: "원하는 과목을 선택해주세요."
              },
              
              keyboard: {
                type: "buttons",
                buttons: formula_menu
              }
            }
            render json: msg, status: :ok    

                                    elsif content == "단위"
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile25.uf.tistory.com/image/9964AE4F5AD71B7A28E9B8",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/80?category=999164"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: formula_menu
                                          }
                                        }
                                        render json: msg, status: :ok 
                                        
                                    elsif content == ""
                                        msg = {
                                          message: {
                                            "photo": {
                                              "url": "http://cfile25.uf.tistory.com/image/9964AE4F5AD71B7A28E9B8",
                                              "width": 720,
                                              "height": 630
                                            },
                                            message_button: {
                                              "label": "자세히보기",
                                              "url": "http://dogbok.tistory.com/80?category=999164"
                                            }
                                          },
                                          keyboard: {
                                            type: "buttons",
                                            buttons: formula_menu
                                          }
                                        }
                                        render json: msg, status: :ok                                       




        elsif content == "읽을거리(랜덤)"
            msg = {
              message: {
                text: random_reply
              },
              
              keyboard: {
                type: "buttons",
                buttons: main_menu
              }
            }
            render json: msg, status: :ok  




       

            
            
        elsif content == "충북대학교 어둠의게시판"
            msg = {
              message: {
                "photo": {
                       "url": "http://cfile25.uf.tistory.com/image/992DAB425AD521511EE54E" ,
                      "width": 720,
                      "height": 630
                   },
                    "message_button": {
                      "label": "가즈아",     
                      "url": "http://cbnu.xyz"
                    }
              },
              
              keyboard: {
                type: "buttons",
                buttons: main_menu
              }
            }
            render json: msg, status: :ok            
            
            
            
            
            
            
        else
            msg = {
              message: {
                  text: "잘못된 입력입니다.다시선택해주세요."
              },

              
              keyboard: {
                type: "buttons",
                buttons: main_menu
              }
            }
            render json: msg, status: :ok
            
        end
    end
    



    def friend
        if request.method == 'POST'
            render status: 200
        elsif request.method == 'DELETE'
            render status: 200
        end
    end


    # 채팅방 나갔을 때 구현
    def chat_room
        if request.method == 'DELETE'
            render status: 200
        end
    end
    
    
    
    

    
end
