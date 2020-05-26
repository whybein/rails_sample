class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments
end

# confirmable 유저인증
# lockable 회원정지 ex) 비번 3회 입력 오류
# timeoutable 일정 시간 뒤 자동 로그아웃
# omniauthable 페북/구글 로그인