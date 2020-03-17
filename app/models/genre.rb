class Genre < ApplicationRecord
  has_many :products

  # boolean は enum使うとfalseで不具合が起きたので、ja.ymlで変換するだけとする
  # enum display_status: {chk_true: true, chk_false: false}
end
