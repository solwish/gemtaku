class User < ActiveRecord::Base
  rolify
  after_create :assign_default_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments
  has_many :escapes
  has_many :joins

  validates :phone,:presence => true,
                 :numericality => true,
                 :length => { :minimum => 10, :maximum => 15 }

  before_save {self.email = email.downcase}                                       #이메일을 저장하기 전, 주소를 소문자로 변환
    VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i        #정규식을 이용해 이메일 형식을 지정
    validates :name, presence: true, length: {maximum: 50}                        #이름과 이메일이 반드시 존재하고 50,255자를 넘지 않게하는 유효성검사
    validates :email, presence: true, length: {maximum: 255},                     #validates (존재를 확인), presence(오직 하나만 존재),
            format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false} #출처: bambi.tistory.com

  def assign_default_role
    self.add_role(:newuser) if self.roles.blank?
  end
end
