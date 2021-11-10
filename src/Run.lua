-- List of all files in the program
programs = {}
programs["Main.lua"] = 1
programs["Players.lua"] = 1
programs["Alarm.lua"] = 1
programs["Ores.lua"] = 1

for table, File in pairs(programs) do
    shell.run("delete " .. table)
    shell.run('github get ' .. table .. " " .. table)
end
shell.run("Main")