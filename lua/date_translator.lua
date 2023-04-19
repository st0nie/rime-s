local function date_translator(input, seg)
	if input == "date" then
		--- Candidate(type, start, end, text, comment)
		local cand = Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d"), "")
		cand.quality = 100
		yield(cand)
		local cand = Candidate("date", seg.start, seg._end, os.date("%Y年%m月%d日"), "")
		cand.quality = 100
		yield(cand)
		local cand = Candidate("date", seg.start, seg._end, os.date("%Y%m%d"), "")
		cand.quality = 100
		yield(cand)
	end
	if input == "time" then
		--- Candidate(type, start, end, text, comment)
		local cand = Candidate("time", seg.start, seg._end, os.date("%H:%M:%S"), "")
		cand.quality = 100
		yield(cand)
		local cand = Candidate("time", seg.start, seg._end, os.date("%H时%M分%S秒"), "")
		cand.quality = 100
		yield(cand)
		local cand = Candidate("time", seg.start, seg._end, os.date("%H%M%S"), "")
		cand.quality = 100
		yield(cand)
	end
	if input == "timestamp" then
		--- Candidate(type, start, end, text, comment)
		local cand = Candidate("time", seg.start, seg._end, os.time(), "")
		cand.quality = 100
		yield(cand)
	end
	if input == "datetime" then
		--- Candidate(type, start, end, text, comment)
		local cand = Candidate("datetime", seg.start, seg._end, os.date("%Y-%m-%d %H:%M:%S"), "")
		cand.quality = 100
		yield(cand)
		local cand = Candidate("datetime", seg.start, seg._end, os.date("%Y-%m-%dT%H:%M:%S+08:00"), "")
		cand.quality = 100
		yield(cand)
		local cand = Candidate("datetime", seg.start, seg._end, os.date("%Y%m%d%H%M"), "")
		cand.quality = 100
		yield(cand)
	end

	-- 输入星期
	-- -- @JiandanDream
	-- -- https://github.com/KyleBing/rime-wubi86-jidian/issues/54
	if input == "week" then
		local weekTab = { "日", "一", "二", "三", "四", "五", "六", "七" }
		local cand = Candidate("week", seg.start, seg._end, "周" .. weekTab[tonumber(os.date("%w") + 1)], "")
		cand.quality = 100
		yield(cand)
		local cand = Candidate("week", seg.start, seg._end, "星期" .. weekTab[tonumber(os.date("%w") + 1)], "")
		cand.quality = 100
		yield(cand)
		local cand = Candidate("week", seg.start, seg._end, os.date("%A"), "")
		cand.quality = 100
		yield(cand)
		local cand = Candidate("week", seg.start, seg._end, os.date("%a"), "")
		cand.quality = 100
		yield(cand)
		local cand = Candidate("week", seg.start, seg._end, os.date("%W"), "周数")
		cand.quality = 100
		yield(cand)
	end

	-- 输入月份英文
	if input == "month" then
		local cand = Candidate("month", seg.start, seg._end, os.date("%B"), "")
		cand.quality = 100
		yield(cand)
		local cand = Candidate("month", seg.start, seg._end, os.date("%b"), "")
		cand.quality = 100
		yield(cand)
	end
end

return date_translator
