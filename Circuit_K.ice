{
  "version": "1.2",
  "package": {
    "name": "",
    "version": "",
    "description": "",
    "author": "",
    "image": ""
  },
  "design": {
    "board": "iCEBreaker",
    "graph": {
      "blocks": [
        {
          "id": "c96c7c35-e3de-4e37-9061-4960ef12d1c9",
          "type": "basic.output",
          "data": {
            "name": "",
            "virtual": false,
            "pins": [
              {
                "index": "0",
                "name": "P1_B1",
                "value": "43"
              }
            ]
          },
          "position": {
            "x": 1216,
            "y": 232
          }
        },
        {
          "id": "c0ff7eb5-c449-4d29-930c-2fa663e8b358",
          "type": "basic.input",
          "data": {
            "name": "",
            "virtual": false,
            "pins": [
              {
                "index": "0",
                "name": "CLK",
                "value": "35"
              }
            ],
            "clock": false
          },
          "position": {
            "x": 440,
            "y": 352
          }
        },
        {
          "id": "6d2c8e62-0638-43ed-b25b-1c85f1b4454e",
          "type": "basic.output",
          "data": {
            "name": "",
            "virtual": false,
            "pins": [
              {
                "index": "0",
                "name": "P1_B2",
                "value": "38"
              }
            ]
          },
          "position": {
            "x": 1216,
            "y": 472
          }
        },
        {
          "id": "1058f3cb-5ebd-44fc-b660-99e7c269f131",
          "type": "basic.code",
          "data": {
            "ports": {
              "in": [
                {
                  "name": "Clk"
                }
              ],
              "out": [
                {
                  "name": "Q_2Hz"
                },
                {
                  "name": "Q_943Hz"
                }
              ]
            },
            "params": [],
            "code": "reg rQ_2Hz = 1'b0;\r\nreg rQ_943Hz = 1'b0;\r\nreg [27:0] Counter_2Hz;\r\nreg [27:0] Counter_943Hz;\r\nparameter fin  = 20_000_000;\r\nparameter fout_2Hz = 2;\r\nparameter fout_943Hz = 943;  // B6729943\r\nparameter Const_2Hz = fin/(2*fout_2Hz);\r\nparameter Const_943Hz = fin/(2*fout_943Hz); \r\n \r\nalways@(posedge Clk) \r\n    begin \r\n        Counter_2Hz <= Counter_2Hz + 1;\r\n        Counter_943Hz <= Counter_943Hz + 1; \r\n        if (Counter_2Hz == Const_2Hz) \r\n            begin \r\n                Counter_2Hz <= 0; \r\n                rQ_2Hz <= ~rQ_2Hz;\r\n            end\r\n        else if (Counter_943Hz == Const_943Hz)\r\n            begin\r\n                Counter_943Hz <= 0;\r\n                rQ_943Hz <= ~rQ_943Hz;\r\n            end\r\n    end \r\nassign Q_2Hz = rQ_2Hz;\r\nassign Q_943Hz = rQ_943Hz;"
          },
          "position": {
            "x": 616,
            "y": 144
          },
          "size": {
            "width": 520,
            "height": 480
          }
        }
      ],
      "wires": [
        {
          "source": {
            "block": "c0ff7eb5-c449-4d29-930c-2fa663e8b358",
            "port": "out"
          },
          "target": {
            "block": "1058f3cb-5ebd-44fc-b660-99e7c269f131",
            "port": "Clk"
          }
        },
        {
          "source": {
            "block": "1058f3cb-5ebd-44fc-b660-99e7c269f131",
            "port": "Q_943Hz"
          },
          "target": {
            "block": "6d2c8e62-0638-43ed-b25b-1c85f1b4454e",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "1058f3cb-5ebd-44fc-b660-99e7c269f131",
            "port": "Q_2Hz"
          },
          "target": {
            "block": "c96c7c35-e3de-4e37-9061-4960ef12d1c9",
            "port": "in"
          }
        }
      ]
    }
  },
  "dependencies": {}
}