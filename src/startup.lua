os.loadAPI("api/github")
print("Starting Up")

if fs.exists("downloader.lua") then
    fs.delete("downloader.lua")
    Print("Downloader deleted")
end

if fs.exists("util/run.lua") then
    fs.delete("util/run.lua")
end

github.getGit("util/run.lua", "util/run")

--shell.run("delete Run")
--shell.run("github get Run.lua Run")
--shell.run("Run")