Factory.define do
  factory :payment do
    amount { 1000 }
    paid_at { Time.current }
    kind { Payment.kinds.keys.sample }
    name { "外食" }
    note { "#{Time.current.strftime('%Y/%m')}にレストランで食事した。"}

    association do

    end

    sequence do |i|
      amount { "#{i}000".to_i }
      paid_at { Time.current + i.day }
      kind { Payment.kinds.keys.sample }
      name { "外食_#{i}" }
      note { "#{Time.current.strftime('%Y/%m')}にレストラン#{i}で食事した。"}
    end
  end
end
