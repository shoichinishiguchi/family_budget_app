module ApplicationHelper
  def next_month(month)
    month == 12 ? 1 : month + 1
  end

  def next_year(year,month)
    month == 12 ? year + 1 : year
  end

  def prev_month(month)
    month == 1 ? 12 : month - 1
  end

  def prev_year(year,month)
    month == 1 ? year - 1 : year
  end

  def month_after_n_months(n: , month: )
    (month + n) % 12 == 0 ? 12 : (month + n)%12
  end

  def year_after_n_months(n:, year:, month:)
    add_year_cnt = (month + n) / 12
    year + add_year_cnt
  end

  def in_6_month_from_now?(year, month)
    Time.now.year * 12 + Time.now.month + 6 >= year*12 + month
  end

  def comma(money)
    money.to_s.reverse.gsub( /(\d{3})(?=\d)/, '\1,').reverse
  end

end
