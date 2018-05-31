class Learningstyle < ApplicationRecord
    belongs_to :user
    #validates :question10,:question1,:question2,:question3,:question4,:question5,:question6,:question6,:question7,:question8,:question9, presence: true
    #validates :question20,:question11,:question12,:question13,:question14,:question15,:question16,:question16,:question17,:question18,:question19, presence: true

   # validates :question30,:question21,:question22,:question23,:question24,:question25,:question26,:question26,:question27,:question28,:question29, presence: true 
   # validates :question40,:question31,:question32,:question33,:question34,:question35,:question36,:question36,:question37,:question38,:question39, presence: true

   # validates :question50,:question41,:question42,:question43,:question44,:question45,:question46,:question46,:question47,:question48,:question49, presence: true
    #validates :question60,:question51,:question52,:question53,:question54,:question55,:question56,:question56,:question57,:question58,:question59, presence: true

    #validates :question70,:question61,:question62,:question63,:question64,:question65,:question66,:question66,:question67,:question68,:question69, presence: true
    #validates :question80,:question71,:question72,:question73,:question74,:question75,:question76,:question76,:question77,:question78,:question79, presence: true
 before_save :calculatetotal

   def calculatetotal
    arrayactivist = [self.question2, self.question4, self.question6, self.question10, self.question17, self.question23, self.question24, self.question32, self.question34, self.question38, self.question40, self.question43, self.question45, self.question48, self.question58, self.question64, self.question71, self.question72, self.question74, self.question79]
    arrayreflectortotal = [self.question7, self.question13, self.question15, self.question16, self.question25, self.question28, self.question29, self.question31, self.question33, self.question36, self.question39, self.question41, self.question46, self.question52, self.question55, self.question60, self.question62, self.question66, self.question67, self.question76]
    arraytheorist = [self.question1, self.question3, self.question8, self.question12, self.question14, self.question18, self.question20, self.question22, self.question26, self.question30, self.question42, self.question47, self.question51, self.question57, self.question61, self.question63, self.question68, self.question75, self.question77, self.question78]
    arraypragmatist = [self.question5, self.question9, self.question11, self.question19, self.question21, self.question27, self.question35, self.question37, self.question44, self.question49, self.question50, self.question53, self.question54, self.question56, self.question59, self.question65, self.question69, self.question70, self.question73, self.question80]

    arrayCompltedNo = [self.question2, self.question4, self.question6, self.question10, self.question17, self.question23, self.question24, self.question32, self.question34, self.question38, self.question40, self.question43, self.question45, self.question48, self.question58, self.question64, self.question71, self.question72, self.question74, self.question79,
      self.question7, self.question13, self.question15, self.question16, self.question25, self.question28, self.question29, self.question31, self.question33, self.question36, self.question39, self.question41, self.question46, self.question52, self.question55, self.question60, self.question62, self.question66, self.question67, self.question76,
      self.question1, self.question3, self.question8, self.question12, self.question14, self.question18, self.question20, self.question22, self.question26, self.question30, self.question42, self.question47, self.question51, self.question57, self.question61, self.question63, self.question68, self.question75, self.question77, self.question78,
    self.question5, self.question9, self.question11, self.question19, self.question21, self.question27, self.question35, self.question37, self.question44, self.question49, self.question50, self.question53, self.question54, self.question56, self.question59, self.question65, self.question69, self.question70, self.question73, self.question80]
    
    self.activisttotal = 0
    self.reflectortotal = 0
    self.theoristtotal = 0
    self.pragmatisttotal = 0
    self.completed_no = 0

    arrayCompltedNo.each do | array |
      if array == 'true' ||  array == 'false'
        self.completed_no = self.completed_no.to_i + 1
      end
    end
    
    arrayactivist.each do | array |
      if array == 'true'
        self.activisttotal = self.activisttotal.to_i + 1
      end
    end

    arrayreflectortotal.each do | array |
      if array == 'true'
        self.reflectortotal = self.reflectortotal.to_i + 1
      end
    end

    arraytheorist.each do | array |
      if array == 'true'
        self.theoristtotal = self.theoristtotal.to_i + 1
      end
    end

    arraypragmatist.each do | array |
      if array == 'true'
        self.pragmatisttotal = self.pragmatisttotal.to_i + 1
      end
    end

  if self.activisttotal >=0 and self.activisttotal <= 3
    self.actstatus = 'Very Low Preference'
  elsif self.activisttotal >=4 and self.activisttotal <= 6
    self.actstatus = 'Low Preference'
  elsif self.activisttotal >=7 and self.activisttotal <= 10
    self.actstatus = 'Moderate Preference'
  elsif self.activisttotal >=11 and self.activisttotal <= 12
    self.actstatus = 'Strong Preference'
  elsif self.activisttotal >=13 and self.activisttotal <= 20
    self.actstatus = 'Very Strong Preference'
 end

   if self.reflectortotal >=0 and self.reflectortotal <= 8
    self.refstatus = 'Very Low Preference'
  elsif self.reflectortotal >=9 and self.reflectortotal <= 11
    self.refstatus = 'Low Preference'
  elsif self.reflectortotal >=12 and self.reflectortotal <= 14
    self.refstatus = 'Moderate Preference'
  elsif self.reflectortotal >=15 and self.reflectortotal <= 17
    self.refstatus = 'Strong Preference'
  elsif self.reflectortotal >=18 and self.reflectortotal <= 20
    self.refstatus = 'Very Strong Preference'
 end

   if self.theoristtotal >=0 and self.theoristtotal <= 7
    self.theostatus = 'Very Low Preference'
  elsif self.theoristtotal >=8 and self.theoristtotal <= 10
    self.theostatus = 'Low Preference'
  elsif self.theoristtotal >=11 and self.theoristtotal <= 13
    self.theostatus = 'Moderate Preference'
  elsif self.theoristtotal >=14 and self.theoristtotal <= 15
    self.theostatus = 'Strong Preference'
  elsif self.theoristtotal >=16 and self.theoristtotal <= 20
    self.theostatus = 'Very Strong Preference'
 end

   if self.pragmatisttotal >=0 and self.pragmatisttotal <= 3
    self.pragstatus = 'Very Low Preference'
  elsif self.pragmatisttotal >=4 and self.pragmatisttotal <= 6
    self.pragstatus = 'Low Preference'
  elsif self.pragmatisttotal >=7 and self.pragmatisttotal <= 10
    self.pragstatus = 'Moderate Preference'
  elsif self.pragmatisttotal >=11 and self.pragmatisttotal <= 12
    self.pragstatus = 'Strong Preference'
  elsif self.pragmatisttotal >=13 and self.pragmatisttotal <= 20
    self.pragstatus = 'Very Strong Preference'
 end
end
end
