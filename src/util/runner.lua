-- List of all files in the program
os.loadAPI("api/github")

programs = {}
programs["util/main"] = 1 -- Util
programs["util/config"] = 1

programs["main/mining"] = 2 -- Main
programs["main/ores"] = 2
programs["main/players"] = 2
programs["main/screens"] = 2

programs["api/alarm"] = 3 -- API
programs["api/chat"] = 3
programs["api/redstone"] = 3

for table, File in pairs(programs) do -- Updates all the programs
    fs.delete(table)
    github.getGit(table .. ".lua", table)
end

shell.run("util/main")