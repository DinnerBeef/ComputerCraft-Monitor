-- List of all files in the program
programs = {}
programs["Main"] = 1
programs["Players"] = 1

for table, File in pairs(programs) do
    shell.run("delete " .. table)
    shell.run('github get ' .. table .. table)
end
shell.run("Main")