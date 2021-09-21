/*
 * SPDX-License-Identifier: GPL-3.0-only
 * MuseScore-CLA-applies
 *
 * MuseScore
 * Music Composition & Notation
 *
 * Copyright (C) 2021 MuseScore BVBA and others
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 3 as
 * published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */
import QtQuick 2.15
import QtQuick.Controls 2.15

import MuseScore.Ui 1.0
import MuseScore.UiComponents 1.0
import MuseScore.Inspector 1.0

import "../../common"
import "internal"

Column {
    id: root

    property QtObject model: null

    objectName: "PedalSettings"

    spacing: 12

    CheckBox {
        checked: root.model && root.model.pedalSymbolVisible

        text: qsTrc("inspector", "Show pedal symbol")

        onClicked: {
            root.model.pedalSymbolVisible = !checked
        }
    }

    LineTypeSection {
        startHookType: root.model ? root.model.startHookType : null
        endHookType: root.model ? root.model.lineType : null

        thickness: root.model ? root.model.thickness : null
        hookHeight: root.model ? root.model.hookHeight : null

        possibleStartHookTypes: root.model ? root.model.possibleStartHookTypes() : null
        possibleEndHookTypes: root.model ? root.model.possibleEndHookTypes() : null
    }

    CheckBox {
        isIndeterminate: root.model && root.model.isLineVisible.isUndefined
        checked: root.model && !isIndeterminate && root.model.isLineVisible.value
        visible: root.model && root.model.isChangingLineVisibilityAllowed

        text: qsTrc("inspector", "Show line with rosette")

        onClicked: {
            root.model.isLineVisible.value = !checked
        }
    }

    SeparatorLine { anchors.margins: -10 }

    LineStyleSection {
        lineStyle: root.model ? root.model.lineStyle : null
        dashLineLength: root.model ? root.model.dashLineLength : null
        dashGapLength: root.model ? root.model.dashGapLength : null
    }
}
