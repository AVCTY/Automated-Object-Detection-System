import os

for filename in os.listdir("brickjoint-red"):  #replace with folder name
    if filename.endswith(".txt"):
        with open(os.path.join("brickjoint-red" , filename) , "r") as f:  #replace with folder name
            lines = f.readlines()
            
            for i in range(len(lines)):
                if (lines[i][:1]) != "2":
                    print(filename)
                    print(lines[i][:1])

            # for i in range(len(lines)):
            #     lines[i] = lines[i].replace("1", "2", 1)   #replace first two parameters with previous character and new character respectively

        # with open(os.path.join("brickjoint-red" , filename) , "w") as outfile:  #replace with folder name
        #     outfile.writelines(lines)