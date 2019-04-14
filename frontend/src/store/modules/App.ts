import {IUser} from "@/interfaces/IUser";

export interface IAppStore {
  user: IUser|null;
}

const state: IAppStore = {
  user: null,
};

const mutations = {
  SET_USER (state, user: IUser) {
    state.user = user
  },
};

const actions = {};

export default {
  state,
  mutations,
  actions
}
