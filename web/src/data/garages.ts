interface Garage {
    name: string;
    position: string | string[] | undefined;
    isDiagonal?: boolean;
}

export const garages: Record<number, Garage> = {
    0: { name: '"Life\'s a Beach" Mission Garage (Commerce)', position: '1643.43, -1520.3, 14.3438' },
    1: { name: 'LSPD Police Impound Garage (not working)', position: undefined },
    2: { name: '"Los Desperados" Mission Garage (El Corona)', position: '1877.41, -2096.51, 14.0391' },
    3: { name: 'Eight Ball Autos (El Corona)', position: '1843.37, -1856.32, 13.875' },
    4: { name: '"Cesar Vialpando" Mission Garage (El Corona)', position: '1798.69, -2146.73, 14' },
    5: { name: 'Player Garage (El Corona)', position: '1698.91, -2088.74, 14.1406' },
    6: { name: 'LS Burglary Garage (Playe del Seville)', position: '2741.07, -2004.78, 14.875' },
    7: { name: 'LowRider Tuning Garage (Willowfield)', position: '2644.86, -2039.23, 14.0391' },
    8: { name: 'Pay \'n\' Spray (Idlewood)', position: '2071.48, -1831.42, 14.5625' },
    9: { name: 'Player Garage (Ganton)', position: '2505.52, -1690.99, 14.3281' },
    10: { name: 'Transfender (Temple)', position: '1041.35, -1025.93, 32.6719' },
    11: { name: 'Pay \'n\' Spray (Temple)', position: '1024.98, -1029.35, 33.1953' },
    12: { name: 'Pay \'n\' Spray (Santa Maria Beach)', position: '488.28, -1734.7, 12.3906' },
    13: { name: 'Player Garage (Santa Maria Beach)', position: '322.4141, -1769.0312, 5.25' },
    14: { name: 'Player Garage (Mulholland)', isDiagonal: true, position: '1353.48, -626.63, 109.82' },
    15: { name: 'Wheel Archangels (Ocean Flats)', position: '-2716.35, 217.48, 5.3828' },
    16: { name: '"T-Bone Mendez" Mission Garage (Ocean Flats)', position: '-2730.47, 72.32, 5.3516' },
    17: { name: 'Player Garage (Hashbury)', position: '-2454.12, -123.06, 26.9844' },
    18: { name: 'Transfender (Doherty)', position: '-1935.86, 239.53, 35.3516' },
    19: { name: 'Pay \'n\' Spray (Downtown)', position: '-1904.53, 277.9, 42.9531' },
    20: { name: 'SF Burglary Garage (Doherty)', position: '-2102.93, -16.05, 36.4844' },
    21: { name: 'Player Garage (Doherty)', position: '-2026.91, 129.41, 30.4531' },
    22: { name: 'Mission Garage (Doherty)', position: '-2038.93, 178.81, 29.9375' },
    23: { name: '"Ran Fa Li" Mission Garage (Chinatown)', position: '-2162.03, 654.66, 53.375' },
    24: { name: 'Michelle\'s Pay \'n\' Spray (Downtown)', position: '-1786.81, 1209.42, 25.8359' },
    25: { name: 'Player Garage (Calton Heights)', position: '-2105.2, 896.93, 77.4453' },
    26: { name: 'SFPD Police Impound Garage (not working)', position: undefined },
    27: { name: 'Pay \'n\' Spray (Juniper Hollow)', position: '-2425.73, 1027.99, 52.2812' },
    28: { name: 'Player Garage (Paradiso)', position: '-2696.01, 821.45, 50.8516' },
    29: { name: 'LVPD Police Impound Garage (not working)', position: undefined },
    30: { name: 'Airport Hangar (Las Venturas Airport)', position: '1586.26, 1222.7, 19.75' },
    31: { name: 'LV Burglary Garage (Pilgrim)', position: '2609.52, 1438.37, 11.5938' },
    32: { name: 'Pay \'n\' Spray (Royal Casino) (not working)', position: undefined },
    33: { name: 'Transfender (Come-A-Lot)', position: '2386.66, 1043.6, 11.5938' },
    34: { name: 'Player Garage (Rockshore West)', position: '2449.55, 698.08, 11.6797' },
    35: { 
        name: 'Welding Wedding Bomb-workshop [front and back] (Redsands East)', 
        position: ['2006, 2303.73, 11.3125', '2006, 2317.6, 11.3125'] 
    },
    36: { name: 'Pay \'n\' Spray (Redsands East)', position: '1968.74, 2162.49, 12.0938' },
    37: { name: 'Player Garage (Redsands West)', position: '1408.64, 1902.69, 11.6797' },
    38: { name: 'Player Garage (Prickle Pine)', position: '1278.7, 2529.81, 11.3203' },
    39: { name: 'Player Garage (Whitewood Estates)', position: '929.55, 2012.06, 11.6797' },
    40: { name: 'Pay \'n\' Spray (El Quebrados)', position: '-1420.55, 2591.16, 57.7422' },
    41: { name: 'Pay \'n\' Spray (Fort Carson)', position: '-100, 1111.41, 21.6406' },
    42: { name: 'Player Garage (Fort Carson)', position: '-360.77, 1194.26, 20.5938' },
    43: { name: 'Player Garage (Verdant Meadows)', position: '429.98, 2546.52, 17.3516' },
    44: { name: '"Interdiction" Mission Garage (El Castillo del Diablo)', isDiagonal: true, position: '-389.59, 2227.91, 42.9219' },
    45: { 
        name: 'Airport Hangar [right and left] (Verdant Meadows)', 
        position: ['397.48, 2476.63, 19.5156', '412.12, 2476.63, 19.5156'] 
    },
    46: { name: '"Puncture Wounds" Mission Garage (Angel Pine)', isDiagonal: true, position: '-2113.04, -2460.62, 30.9141' },
    47: { name: 'Pay \'n\' Spray (Dillimore)', position: '720.02, -462.52, 16.8594' },
    48: { name: 'Player Garage (Palomino Creek)', position: '2231.24, 168.73, 27.7734' },
    49: { name: 'Player Garage (Dillimore)', position: '786.01, -492.87, 17.6328' }
};
