-- List of all files in the program
os.loadAPI("api/github")

programs = {}
programs["util/main.lua"] = 0 -- Util

programs["main/mining"] = 1 -- Main
programs["main/ores"] = 1
programs["main/players"] = 1
programs["main/screens"] = 1

programs["api/alarm"] = 2 -- API
programs["api/chat"] = 2
programs["api/redstone"] = 2

for table, File in pairs(programs) do -- Updates all the programs
    fs.delete(table)
    github.getGit(table)
end

shell.run("main")