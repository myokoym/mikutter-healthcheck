# -*- coding: utf-8 -*-

Plugin.create(:healthcheck) do

  defactivity "healthcheck", "ヘルスチェック"

  now = Time.new
  time = Time.mktime now.year, now.mon, now.day, now.hour, now.min, now.sec

  def next_second(time)
    time += 1
    notice "next second #{time}"
    Reserver.new(time) {
      activity :healthcheck, "生きてます"
      next_second(time)
    }
  end
  next_second(time)
end
