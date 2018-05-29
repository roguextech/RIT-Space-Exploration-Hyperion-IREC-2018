nulldata_keys = []

lsm9ds1_keys = [
    'ax', 'ay', 'az',
    'gx', 'gy', 'gz',
    'mx', 'my', 'mz'
]

bme280_keys = [
    'temperature',
    'pressure',
    'humidity',
    'altitude'
]

ccs811_keys = [
    'co2', 'tvoc'
]

lis331_keys = [
    'ax', 'ay', 'az'
]

pfsl_keys = [
    'alt'
]

oren_keys = [
    'pitch',
    'roll',
    'yaw'
]

cmmd_keys = []

info_keys = []

data_type_handler = {
    0   : nulldata_keys,
    1   : lsm9ds1_keys,
    2   : bme280_keys,
    3   : ccs811_keys,
    4   : lis331_keys,
    5   : pfsl_keys,
    6   : oren_keys,
    7   : cmmd_keys,
    8   : info_keys
}

def header_handler(header_lst):
    return int(header_lst[0]) , [ int(flag) for flag in header_lst[1:5] ] , int(header_lst[5])

def payload_builder(data_type, time, values):
    keys = data_type_handler[data_type]
    payload = {}
    payload['timeStamp'] = time
    for idx,key in enumerate(keys):
        payload[key] = values[idx] # num of values & keys should be the same
    return payload