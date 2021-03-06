class User < ActiveRecord::Base
  rolify
  after_create :assign_default_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable#, omniauth_providers: %i[facebook]

  has_many :comments
  has_many :escapes
  has_many :joins
  has_many :talks
  belongs_to :club
  has_many :shop_reviews

  # 폰 유효성검사
  # validates :phone,:presence => true,
  #                :numericality => true,
  #                :length => { :minimum => 10, :maximum => 15 }

  before_save {self.email = email.downcase}
  # before_update {self.nickname = nickname.strip.downcase}
  before_create {self.club_id = 1}

  # before_save {self.club_id = 1}
  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  # validates :name, presence: true, length: {maximum: 20}, format: {without: /\s/, :message => "can't use space"}

  # validates :nickname, length: {maximum: 20}, format: {without: /\s/, :message => "can't use space"}
  validates :email, presence: true, length: {maximum: 255},
            format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}

  def assign_default_role
    self.add_role(:newuser) if self.roles.blank?
  end

  def self.from_omniauth(auth)
    # where(provider: auth.provider, uid: auth.uid, email: auth.info.email).first_or_create do |user|
    where(email: auth.info.email).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      # user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      # user.password_confirmation = user.email
      user.name = auth.info.name.delete(' ')   # assuming the user model has a name
      # user.nickname = Faker::Name.unique.name.delete(' ').downcase   #위 유효성검사 통과를 위해 faker 변수 사용
      user.gender = auth.extra.raw_info.gender if user.provider == "facebook"
      user.gender = auth.info.gender if user.provider == "naver"
      user.gender = "male" if user.gender == "M"
      user.gender = "female" if user.gender == "F"

      user.club_id = 1
      # user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      user.skip_confirmation!
    end
  end

end
