from benedict import benedict
import sys

try:
    input_file = str(sys.argv[1])
except:
    print('Usage -- json2cfg.py inputfile')
    sys.exit

try:
    output_file = str(sys.argv[2])
except:
    output_file = input_file.replace('.json', '.conf')


input_data = benedict.from_json(input_file)
open(output_file,'w')
output_data = input_data.to_ini(filepath=output_file)