<template>
  <div class="tablePage" v-if="data_ready">
    <div class="q-pa-md table">
      <q-table
        flat
        bordered
        :rows="rows"
        :columns="columns"
        row-key="name"
        :rows-per-page-options="[10]"
      >
        <template v-slot:top>
          <q-btn
            flat
            outline
            dense
            color="primary"
            label="Add row"
            @click="addRecord"
          ></q-btn>
        </template>

        <template #body="props">
          <q-tr :props="props">
            <q-td
              v-for="i in columns.length"
              :key="columnName[i - 1]"
              :props="props"
            >
              {{ props.row[columnName[i - 1]] }}
            </q-td>
            <q-td key="actions">
              <q-btn
                color="primary"
                icon="edit"
                flat
                round
                @click="editRecord(props.row)"
              />
              <q-btn
                color="red"
                icon="delete"
                flat
                round
                @click="deleteRecord(props.row)"
              />
            </q-td>
          </q-tr>
        </template>
      </q-table>
    </div>
    <q-dialog v-model="add_dialog" persistent>
      <q-card>
        <q-card-section>
          <div class="row">
            <q-input
              v-for="i in newInput_length - 1"
              :key="i"
              v-model="newInput[columnName[i]]"
              :label="columnName[i]"
              class="input"
            ></q-input>
          </div>
        </q-card-section>
        <q-card-actions align="right">
          <q-btn
            flat
            label="Cancel"
            color="primary"
            @click="add_dialog = false"
            v-close-popup
          />
          <q-btn
            flat
            label="Add"
            color="primary"
            @click="onAdd"
            v-close-popup
          />
        </q-card-actions>
      </q-card>
    </q-dialog>

    <q-dialog v-model="show_dialog" persistent>
      <q-card>
        <q-card-section>
          <div class="text-h6">Add new item!</div>
        </q-card-section>

        <q-card-section>
          <div class="row">
            <q-input
              v-for="i in input_length - 1"
              :key="i"
              v-model="input[columnName[i]]"
              :label="columnName[i]"
              class="input"
            ></q-input>
          </div>
        </q-card-section>

        <q-card-actions align="right">
          <q-btn
            flat
            label="update"
            color="primary"
            v-close-popup
            @click="onEdit"
          ></q-btn>
          <q-btn
            flat
            label="cancel"
            color="red"
            v-close-popup
            @click="onCancel"
          ></q-btn>
        </q-card-actions>
      </q-card>
    </q-dialog>
    <q-dialog v-model="del_dialog" persistent>
      <q-card>
        <q-card-section class="row items-center">
          <q-avatar icon="delete" color="red" text-color="white" />
          <span class="q-ml-sm"
            >Are you sure to DELETE {{ tableName }} ID:
            {{ input[columnName[0]] }}</span
          >
        </q-card-section>
        <q-card-actions align="right">
          <q-btn
            flat
            label="Cancel"
            color="primary"
            @click="del_dialog = false"
            v-close-popup
          />
          <q-btn
            flat
            label="Delete"
            color="red"
            @click="onDelete"
            v-close-popup
          />
        </q-card-actions>
      </q-card>
    </q-dialog>
  </div>
</template>

<script>
import { Notify } from "quasar";

export default {
  name: "TablePage",
  setup() {
    return {
      tableName: "",
    };
  },
  data() {
    return {
      data: [],
      columns: [],
      columnName: [],
      rows: [],
      add_dialog: false,
      show_dialog: false,
      del_dialog: false,
      data_ready: false,
      input: {},
      input_length: 0,
      newInput: {},
      newInput_length: 0,
    };
  },
  methods: {
    setData() {
      this.columns = [];
      this.columnName = [];
      this.rows = [];
      Object.keys(this.data[0]).map((item) => {
        const column = { name: item, label: item, field: item };
        this.columns.push(column);
        this.columnName.push(item);
        return;
      });

      this.data.map((item) => {
        this.rows.push(item);
      });
      this.data_ready = true;
    },
    async getData(name) {
      await this.$api
        .get("/table/" + name)
        .then((res) => {
          this.data = res.data;
          this.setData();
        })
        .catch((err) => {
          console.log(err);
        });
    },
    addRecord() {
      this.newInput = {};
      this.newInput_length = this.columnName.length;
      this.add_dialog = true;
    },
    onAdd() {
      const data = this.newInput;
      this.$api
        .post("/table/" + this.tableName, data)
        .then((res) => {
          if (res.status == 200) {
            Notify.create({
              message: "Successfully added new row",
              type: "positive",
            });
            this.getData(this.tableName);
          }
        })
        .catch((err) => {
          console.log(err);
        });
    },
    editRecord(row) {
      this.input_length = Object.keys(row).length;
      this.show_dialog = true;
      this.input = row;
    },
    onEdit() {
      this.show_dialog = false;
      let data = {};
      this.columnName.map((name) => {
        data[name] = this.input[name];
      });
      data["colName"] = this.columnName[0];
      const id = parseInt(data[this.columnName[0]]);
      console.log("/table/" + this.tableName + "/" + id, data);
      this.$api
        .put("/table/" + this.tableName + "/" + id, data)
        .then((res) => {
          if (res.status == 200) {
            Notify.create({
              message:
                "Updated " + this.tableName + " of ID: " + id + " succesfully",
              type: "positive",
            });
          }
        })
        .catch((err) => {
          console.log(err);
        });
    },
    onCancel() {
      this.show_dialog = false;
      this.getData(this.tableName);
    },
    deleteRecord(row) {
      this.input = row;
      this.del_dialog = true;
    },
    onDelete() {
      const name = this.tableName;
      const colName = this.columnName[0];
      const id = this.input[this.columnName[0]];
      this.$api
        .delete(`/table/${name}/${colName}/${id}`)
        .then((res) => {
          if (res.status == 200) {
            Notify.create({
              type: "positive",
              message: "Deleted " + this.tableName + " of ID: " + res.data.id,
            });
            this.getData(this.tableName);
          }
        })
        .catch((err) => {
          console.log(err);
        });
    },
  },
  mounted() {
    this.getData(this.tableName);
  },
  beforeCreate() {
    this.tableName = this.$router.currentRoute.value.params.name;
  },
};
</script>

<style lang="scss">
.table {
  * {
    text-align: left;
  }
}
thead {
  background: #cef3fc;
  font-weight: bold;
}
.input {
  margin: 0.5rem 1rem;
}
</style>
